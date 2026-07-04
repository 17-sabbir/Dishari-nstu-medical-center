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

abstract class QrTokenDto
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  QrTokenDto._({
    required this.resultId,
    required this.qrToken,
  });

  factory QrTokenDto({
    required int resultId,
    required String qrToken,
  }) = _QrTokenDtoImpl;

  factory QrTokenDto.fromJson(Map<String, dynamic> jsonSerialization) {
    return QrTokenDto(
      resultId: jsonSerialization['resultId'] as int,
      qrToken: jsonSerialization['qrToken'] as String,
    );
  }

  int resultId;

  String qrToken;

  /// Returns a shallow copy of this [QrTokenDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  QrTokenDto copyWith({
    int? resultId,
    String? qrToken,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'QrTokenDto',
      'resultId': resultId,
      'qrToken': qrToken,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'QrTokenDto',
      'resultId': resultId,
      'qrToken': qrToken,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _QrTokenDtoImpl extends QrTokenDto {
  _QrTokenDtoImpl({
    required int resultId,
    required String qrToken,
  }) : super._(
         resultId: resultId,
         qrToken: qrToken,
       );

  /// Returns a shallow copy of this [QrTokenDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  QrTokenDto copyWith({
    int? resultId,
    String? qrToken,
  }) {
    return QrTokenDto(
      resultId: resultId ?? this.resultId,
      qrToken: qrToken ?? this.qrToken,
    );
  }
}
