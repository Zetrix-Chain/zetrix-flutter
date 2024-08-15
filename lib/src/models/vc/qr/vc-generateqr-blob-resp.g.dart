// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vc-generateqr-blob-resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VcGenerateQrBlobResp _$VcGenerateQrBlobRespFromJson(
        Map<String, dynamic> json) =>
    VcGenerateQrBlobResp(
      result: json['result'] == null
          ? null
          : VcGenerateQrBlobResult.fromJson(
              json['result'] as Map<String, dynamic>),
    )
      ..errorCode = (json['error_code'] as num?)?.toInt()
      ..errorDesc = json['error_desc'] as String?;

Map<String, dynamic> _$VcGenerateQrBlobRespToJson(
        VcGenerateQrBlobResp instance) =>
    <String, dynamic>{
      'error_code': instance.errorCode,
      'error_desc': instance.errorDesc,
      'result': instance.result,
    };
