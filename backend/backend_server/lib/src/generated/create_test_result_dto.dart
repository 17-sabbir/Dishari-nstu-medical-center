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

abstract class CreateTestResultDto
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  CreateTestResultDto._({
    required this.resultId,
    required this.qrToken,
  });

  factory CreateTestResultDto({
    required int resultId,
    required String qrToken,
  }) = _CreateTestResultDtoImpl;

  factory CreateTestResultDto.fromJson(Map<String, dynamic> jsonSerialization) {
    return CreateTestResultDto(
      resultId: jsonSerialization['resultId'] as int,
      qrToken: jsonSerialization['qrToken'] as String,
    );
  }

  int resultId;

  String qrToken;

  /// Returns a shallow copy of this [CreateTestResultDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CreateTestResultDto copyWith({
    int? resultId,
    String? qrToken,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CreateTestResultDto',
      'resultId': resultId,
      'qrToken': qrToken,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CreateTestResultDto',
      'resultId': resultId,
      'qrToken': qrToken,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _CreateTestResultDtoImpl extends CreateTestResultDto {
  _CreateTestResultDtoImpl({
    required int resultId,
    required String qrToken,
  }) : super._(
         resultId: resultId,
         qrToken: qrToken,
       );

  /// Returns a shallow copy of this [CreateTestResultDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CreateTestResultDto copyWith({
    int? resultId,
    String? qrToken,
  }) {
    return CreateTestResultDto(
      resultId: resultId ?? this.resultId,
      qrToken: qrToken ?? this.qrToken,
    );
  }
}
