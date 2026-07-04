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
import 'package:serverpod/serverpod.dart' as _i1;

abstract class QrResolveDto
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  QrResolveDto._({
    required this.resultId,
    required this.testId,
    this.testName,
    required this.maskedPatientName,
    required this.maskedMobile,
    required this.isUploaded,
    this.submittedAt,
  });

  factory QrResolveDto({
    required int resultId,
    required int testId,
    String? testName,
    required String maskedPatientName,
    required String maskedMobile,
    required bool isUploaded,
    DateTime? submittedAt,
  }) = _QrResolveDtoImpl;

  factory QrResolveDto.fromJson(Map<String, dynamic> jsonSerialization) {
    return QrResolveDto(
      resultId: jsonSerialization['resultId'] as int,
      testId: jsonSerialization['testId'] as int,
      testName: jsonSerialization['testName'] as String?,
      maskedPatientName: jsonSerialization['maskedPatientName'] as String,
      maskedMobile: jsonSerialization['maskedMobile'] as String,
      isUploaded: jsonSerialization['isUploaded'] as bool,
      submittedAt: jsonSerialization['submittedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['submittedAt'],
            ),
    );
  }

  int resultId;

  int testId;

  String? testName;

  String maskedPatientName;

  String maskedMobile;

  bool isUploaded;

  DateTime? submittedAt;

  /// Returns a shallow copy of this [QrResolveDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  QrResolveDto copyWith({
    int? resultId,
    int? testId,
    String? testName,
    String? maskedPatientName,
    String? maskedMobile,
    bool? isUploaded,
    DateTime? submittedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'QrResolveDto',
      'resultId': resultId,
      'testId': testId,
      if (testName != null) 'testName': testName,
      'maskedPatientName': maskedPatientName,
      'maskedMobile': maskedMobile,
      'isUploaded': isUploaded,
      if (submittedAt != null) 'submittedAt': submittedAt?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'QrResolveDto',
      'resultId': resultId,
      'testId': testId,
      if (testName != null) 'testName': testName,
      'maskedPatientName': maskedPatientName,
      'maskedMobile': maskedMobile,
      'isUploaded': isUploaded,
      if (submittedAt != null) 'submittedAt': submittedAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _QrResolveDtoImpl extends QrResolveDto {
  _QrResolveDtoImpl({
    required int resultId,
    required int testId,
    String? testName,
    required String maskedPatientName,
    required String maskedMobile,
    required bool isUploaded,
    DateTime? submittedAt,
  }) : super._(
         resultId: resultId,
         testId: testId,
         testName: testName,
         maskedPatientName: maskedPatientName,
         maskedMobile: maskedMobile,
         isUploaded: isUploaded,
         submittedAt: submittedAt,
       );

  /// Returns a shallow copy of this [QrResolveDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  QrResolveDto copyWith({
    int? resultId,
    int? testId,
    Object? testName = _Undefined,
    String? maskedPatientName,
    String? maskedMobile,
    bool? isUploaded,
    Object? submittedAt = _Undefined,
  }) {
    return QrResolveDto(
      resultId: resultId ?? this.resultId,
      testId: testId ?? this.testId,
      testName: testName is String? ? testName : this.testName,
      maskedPatientName: maskedPatientName ?? this.maskedPatientName,
      maskedMobile: maskedMobile ?? this.maskedMobile,
      isUploaded: isUploaded ?? this.isUploaded,
      submittedAt: submittedAt is DateTime? ? submittedAt : this.submittedAt,
    );
  }
}
