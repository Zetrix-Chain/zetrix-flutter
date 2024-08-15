// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vc-audit-blob-resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VcAuditBlobResp _$VcAuditBlobRespFromJson(Map<String, dynamic> json) =>
    VcAuditBlobResp(
      result: json['result'] == null
          ? null
          : VcAuditBlobResult.fromJson(json['result'] as Map<String, dynamic>),
    )
      ..errorCode = (json['error_code'] as num?)?.toInt()
      ..errorDesc = json['error_desc'] as String?;

Map<String, dynamic> _$VcAuditBlobRespToJson(VcAuditBlobResp instance) =>
    <String, dynamic>{
      'error_code': instance.errorCode,
      'error_desc': instance.errorDesc,
      'result': instance.result,
    };
