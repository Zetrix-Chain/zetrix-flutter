// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vc-audit-submit-req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VcAuditSubmitReq _$VcAuditSubmitReqFromJson(Map<String, dynamic> json) =>
    VcAuditSubmitReq(
      payloadId: json['payloadId'] as String?,
      signPayload: json['signPayload'] as String?,
      signBcTxBlob: json['signBcTxBlob'] as String?,
      publicKey: json['publicKey'] as String?,
      border: (json['border'] as num?)?.toInt(),
    );

Map<String, dynamic> _$VcAuditSubmitReqToJson(VcAuditSubmitReq instance) =>
    <String, dynamic>{
      'payloadId': instance.payloadId,
      'signPayload': instance.signPayload,
      'signBcTxBlob': instance.signBcTxBlob,
      'publicKey': instance.publicKey,
      'border': instance.border,
    };
