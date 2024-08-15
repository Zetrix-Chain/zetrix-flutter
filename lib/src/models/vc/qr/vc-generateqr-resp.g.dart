// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vc-generateqr-resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VcGenerateQrResp _$VcGenerateQrRespFromJson(Map<String, dynamic> json) =>
    VcGenerateQrResp(
      result: json['result'] == null
          ? null
          : VcGenerateQrResult.fromJson(json['result'] as Map<String, dynamic>),
    )
      ..errorCode = (json['error_code'] as num?)?.toInt()
      ..errorDesc = json['error_desc'] as String?;

Map<String, dynamic> _$VcGenerateQrRespToJson(VcGenerateQrResp instance) =>
    <String, dynamic>{
      'error_code': instance.errorCode,
      'error_desc': instance.errorDesc,
      'result': instance.result,
    };
