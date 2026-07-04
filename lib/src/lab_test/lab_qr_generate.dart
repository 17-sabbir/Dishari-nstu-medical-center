// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:backend_client/backend_client.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

/// Shows the QR code for a single test result. Lab staff print/attach
/// this to the physical sample. Call from wherever you currently show
/// a result row (e.g. lab_test_create_and_upload.dart) with:
///
///   Navigator.push(context, MaterialPageRoute(
///     builder: (_) => LabQrGenerateScreen(resultId: result.resultId!),
///   ));
class LabQrGenerateScreen extends StatefulWidget {
  final int resultId;
  const LabQrGenerateScreen({super.key, required this.resultId});

  @override
  State<LabQrGenerateScreen> createState() => _LabQrGenerateScreenState();
}

class _LabQrGenerateScreenState extends State<LabQrGenerateScreen> {
  QrTokenDto? _qr;
  bool _loading = true;
  bool _printing = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final qr = await client.lab.generateResultQr(resultId: widget.resultId);
      if (!mounted) return;
      setState(() {
        _qr = qr;
        _loading = false;
        if (qr == null) _error = 'QR generate করা যায়নি। আবার চেষ্টা করুন।';
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _loading = false;
        _error = 'Error: $e';
      });
    }
  }

 

  /// Builds a small label-sized PDF (QR + result id) and opens the
  /// system print dialog / share sheet so staff can print it directly
  /// onto a sticker for the sample tube.
  Future<void> _printLabel() async {
    final qr = _qr;
    if (qr == null) return;

    setState(() => _printing = true);
    try {
      final doc = pw.Document();
      doc.addPage(
        pw.Page(
          pageFormat: PdfPageFormat(
            8 * PdfPageFormat.cm,
            8 * PdfPageFormat.cm,
            marginAll: 0.3 * PdfPageFormat.cm,
          ),
          build: (context) {
            return pw.Center(
              child: pw.Column(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                crossAxisAlignment: pw.CrossAxisAlignment.center,
                children: [
                  pw.BarcodeWidget(
                    barcode: pw.Barcode.qrCode(),
                    data: qr.qrToken,
                    width: 5.5 * PdfPageFormat.cm,
                    height: 5.5 * PdfPageFormat.cm,
                  ),
                  pw.SizedBox(height: 6),
                  pw.Text(
                    'Result ID: ${qr.resultId}',
                    style: const pw.TextStyle(fontSize: 11),
                  ),
                ],
              ),
            );
          },
        ),
      );

      await Printing.layoutPdf(
        onLayout: (format) async => doc.save(),
        name: 'lab-qr-result-${qr.resultId}',
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Print করা যায়নি: $e')));
    } finally {
      if (mounted) setState(() => _printing = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('QR — Result #${widget.resultId}')),
      body: Center(
        child: _loading
            ? const CircularProgressIndicator()
            : _error != null
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(_error!, style: const TextStyle(color: Colors.red)),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: _load,
                    child: const Text('আবার চেষ্টা করুন'),
                  ),
                ],
              )
            : _qr == null
            ? const Text('No QR available')
            : Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: QrImageView(
                        data: _qr!.qrToken,
                        version: QrVersions.auto,
                        size: 240,
                        gapless: true,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Result ID: ${_qr!.resultId}\n'
                      'Valid: Lifetime (never expires)',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: _printing ? null : _printLabel,
                        icon: _printing
                            ? const SizedBox(
                                width: 16,
                                height: 16,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                            : const Icon(Icons.print),
                        label: Text(
                          _printing ? 'Printing...' : 'QR প্রিন্ট করুন',
                        ),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          backgroundColor: Colors.deepPurple,
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ),
                    
                  ],
                ),
              ),
      ),
    );
  }
}
