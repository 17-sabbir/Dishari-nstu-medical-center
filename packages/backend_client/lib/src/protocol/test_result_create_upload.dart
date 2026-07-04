/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class TestResult implements _i1.SerializableModel {
  TestResult._({
    this.resultId,
    required this.testId,
    required this.patientName,
    required this.mobileNumber,
    required this.patientType,
    required this.isUploaded,
    this.attachmentPath,
    this.submittedAt,
    this.createdAt,
    this.qrToken,
    this.qrExpiresAt,
    this.qrScannedCount,
  });

  factory TestResult({
    int? resultId,
    required int testId,
    required String patientName,
    required String mobileNumber,
    required String patientType,
    required bool isUploaded,
    String? attachmentPath,
    DateTime? submittedAt,
    DateTime? createdAt,
    String? qrToken,
    DateTime? qrExpiresAt,
    int? qrScannedCount,
  }) = _TestResultImpl;

  factory TestResult.fromJson(Map<String, dynamic> jsonSerialization) {
    return TestResult(
      resultId: jsonSerialization['resultId'] as int?,
      testId: jsonSerialization['testId'] as int,
      patientName: jsonSerialization['patientName'] as String,
      mobileNumber: jsonSerialization['mobileNumber'] as String,
      patientType: jsonSerialization['patientType'] as String,
      isUploaded: jsonSerialization['isUploaded'] as bool,
      attachmentPath: jsonSerialization['attachmentPath'] as String?,
      submittedAt: jsonSerialization['submittedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['submittedAt'],
            ),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      qrToken: jsonSerialization['qrToken'] as String?,
      qrExpiresAt: jsonSerialization['qrExpiresAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['qrExpiresAt'],
            ),
      qrScannedCount: jsonSerialization['qrScannedCount'] as int?,
    );
  }

  int? resultId;

  int testId;

  String patientName;

  String mobileNumber;

  String patientType;

  bool isUploaded;

  String? attachmentPath;

  DateTime? submittedAt;

  DateTime? createdAt;

  String? qrToken;

  DateTime? qrExpiresAt;

  int? qrScannedCount;

  /// Returns a shallow copy of this [TestResult]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  TestResult copyWith({
    int? resultId,
    int? testId,
    String? patientName,
    String? mobileNumber,
    String? patientType,
    bool? isUploaded,
    String? attachmentPath,
    DateTime? submittedAt,
    DateTime? createdAt,
    String? qrToken,
    DateTime? qrExpiresAt,
    int? qrScannedCount,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'TestResult',
      if (resultId != null) 'resultId': resultId,
      'testId': testId,
      'patientName': patientName,
      'mobileNumber': mobileNumber,
      'patientType': patientType,
      'isUploaded': isUploaded,
      if (attachmentPath != null) 'attachmentPath': attachmentPath,
      if (submittedAt != null) 'submittedAt': submittedAt?.toJson(),
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
      if (qrToken != null) 'qrToken': qrToken,
      if (qrExpiresAt != null) 'qrExpiresAt': qrExpiresAt?.toJson(),
      if (qrScannedCount != null) 'qrScannedCount': qrScannedCount,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TestResultImpl extends TestResult {
  _TestResultImpl({
    int? resultId,
    required int testId,
    required String patientName,
    required String mobileNumber,
    required String patientType,
    required bool isUploaded,
    String? attachmentPath,
    DateTime? submittedAt,
    DateTime? createdAt,
    String? qrToken,
    DateTime? qrExpiresAt,
    int? qrScannedCount,
  }) : super._(
         resultId: resultId,
         testId: testId,
         patientName: patientName,
         mobileNumber: mobileNumber,
         patientType: patientType,
         isUploaded: isUploaded,
         attachmentPath: attachmentPath,
         submittedAt: submittedAt,
         createdAt: createdAt,
         qrToken: qrToken,
         qrExpiresAt: qrExpiresAt,
         qrScannedCount: qrScannedCount,
       );

  /// Returns a shallow copy of this [TestResult]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  TestResult copyWith({
    Object? resultId = _Undefined,
    int? testId,
    String? patientName,
    String? mobileNumber,
    String? patientType,
    bool? isUploaded,
    Object? attachmentPath = _Undefined,
    Object? submittedAt = _Undefined,
    Object? createdAt = _Undefined,
    Object? qrToken = _Undefined,
    Object? qrExpiresAt = _Undefined,
    Object? qrScannedCount = _Undefined,
  }) {
    return TestResult(
      resultId: resultId is int? ? resultId : this.resultId,
      testId: testId ?? this.testId,
      patientName: patientName ?? this.patientName,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      patientType: patientType ?? this.patientType,
      isUploaded: isUploaded ?? this.isUploaded,
      attachmentPath: attachmentPath is String?
          ? attachmentPath
          : this.attachmentPath,
      submittedAt: submittedAt is DateTime? ? submittedAt : this.submittedAt,
      createdAt: createdAt is DateTime? ? createdAt : this.createdAt,
      qrToken: qrToken is String? ? qrToken : this.qrToken,
      qrExpiresAt: qrExpiresAt is DateTime? ? qrExpiresAt : this.qrExpiresAt,
      qrScannedCount: qrScannedCount is int?
          ? qrScannedCount
          : this.qrScannedCount,
    );
  }
}
