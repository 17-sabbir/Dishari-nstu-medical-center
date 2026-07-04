// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:backend_client/backend_client.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import 'lab_test_create_and_upload.dart';

/// Main scan entry point for lab staff. Add a FAB on the lab dashboard:
///
///   FloatingActionButton(
///     onPressed: () => Navigator.push(context,
///         MaterialPageRoute(builder: (_) => const LabQrScannerScreen())),
///     child: const Icon(Icons.qr_code_scanner),
///   )
class LabQrScannerScreen extends StatefulWidget {
  const LabQrScannerScreen({super.key});

  @override
  State<LabQrScannerScreen> createState() => _LabQrScannerScreenState();
}

class _LabQrScannerScreenState extends State<LabQrScannerScreen> {
  final MobileScannerController _controller = MobileScannerController(
    detectionSpeed: DetectionSpeed.noDuplicates,
  );
  bool _busy = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _onDetect(BarcodeCapture capture) async {
    if (_busy) return;
    final code = capture.barcodes.firstOrNull?.rawValue;
    if (code == null || code.isEmpty) return;

    setState(() => _busy = true);
    await _controller.stop();

    try {
      final resolved = await client.lab.resolveQrToken(token: code);
      if (!mounted) return;

      if (resolved == null) {
        _showResultDialog(
          success: false,
          message: 'এই QR টি অচেনা বা মেয়াদ শেষ হয়ে গেছে।\n'
              'Result screen থেকে নতুন QR তৈরি করুন।',
        );
        return;
      }

      // Show confirmation before recording the scan / navigating —
      // this is also where the masked patient info is displayed.
      final action = await _chooseAction(resolved);
      if (action == null) {
        await _controller.start();
        setState(() => _busy = false);
        return;
      }

      final ok = await client.lab.recordQrScan(token: code, action: action);
      if (!mounted) return;

      if (!ok) {
        _showResultDialog(success: false, message: 'Scan record করা যায়নি।');
        return;
      }

      if (action == 'submit_result') {
        // Jump straight into the existing upload/result screen for this
        // specific result — this is the actual time-saver for staff.
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => const LabTestCreateAndUpload(),
          ),
        );
      } else {
        _showResultDialog(
          success: true,
          message: '"${resolved.testName ?? 'Test'}" — '
              '${resolved.maskedPatientName} (${resolved.maskedMobile})\n'
              'Action recorded: $action',
        );
      }
    } catch (e) {
      if (!mounted) return;
      _showResultDialog(success: false, message: 'Error: $e');
    }
  }

  Future<String?> _chooseAction(QrResolveDto resolved) {
    return showModalBottomSheet<String>(
      context: context,
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text(resolved.testName ?? 'Test'),
              subtitle: Text('${resolved.maskedPatientName} · ${resolved.maskedMobile}'),
            ),
            const Divider(height: 1),
            ListTile(
              leading: const Icon(Icons.inventory_2_outlined),
              title: const Text('Sample collect করুন'),
              onTap: () => Navigator.pop(ctx, 'collect_sample'),
            ),
            ListTile(
              leading: const Icon(Icons.upload_file),
              title: const Text('Result upload / submit করুন'),
              onTap: () => Navigator.pop(ctx, 'submit_result'),
            ),
            ListTile(
              leading: const Icon(Icons.visibility_outlined),
              title: const Text('শুধু দেখুন (view only)'),
              onTap: () => Navigator.pop(ctx, 'view'),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  void _showResultDialog({required bool success, required String message}) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        icon: Icon(
          success ? Icons.check_circle : Icons.error_outline,
          color: success ? Colors.green : Colors.red,
        ),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () async {
              Navigator.pop(ctx);
              await _controller.start();
              if (mounted) setState(() => _busy = false);
            },
            child: const Text('আবার Scan করুন'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context)..pop(ctx)..pop(),
            child: const Text('বন্ধ করুন'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan Lab QR')),
      body: MobileScanner(
        controller: _controller,
        onDetect: _onDetect,
      ),
    );
  }
}

extension _FirstOrNull<T> on List<T> {
  T? get firstOrNull => isEmpty ? null : first;
}
