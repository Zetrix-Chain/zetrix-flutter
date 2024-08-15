// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vc-audit-blob-result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VcAuditBlobResult _$VcAuditBlobResultFromJson(Map<String, dynamic> json) =>
    VcAuditBlobResult(
      payload: json['payload'] as String?,
      payloadId: json['payloadId'] as String?,
      bcTxBlob: json['bcTxBlob'] as String?,
    );

Map<String, dynamic> _$VcAuditBlobResultToJson(VcAuditBlobResult instance) =>
    <String, dynamic>{
      'payload': instance.payload,
      'payloadId': instance.payloadId,
      'bcTxBlob': instance.bcTxBlob,
    };
