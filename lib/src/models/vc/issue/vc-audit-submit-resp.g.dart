// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vc-audit-submit-resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VcAuditSubmitResp _$VcAuditSubmitRespFromJson(Map<String, dynamic> json) =>
    VcAuditSubmitResp(
      result: json['result'] == null
          ? null
          : VcGetTokenResult.fromJson(json['result'] as Map<String, dynamic>),
    )
      ..errorCode = (json['error_code'] as num?)?.toInt()
      ..errorDesc = json['error_desc'] as String?;

Map<String, dynamic> _$VcAuditSubmitRespToJson(VcAuditSubmitResp instance) =>
    <String, dynamic>{
      'error_code': instance.errorCode,
      'error_desc': instance.errorDesc,
      'result': instance.result,
    };
