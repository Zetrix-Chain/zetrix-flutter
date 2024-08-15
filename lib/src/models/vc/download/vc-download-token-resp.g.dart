// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vc-download-token-resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VcDownloadTokenResp _$VcDownloadTokenRespFromJson(Map<String, dynamic> json) =>
    VcDownloadTokenResp(
      result: json['result'] == null
          ? null
          : VcDownloadTokenResult.fromJson(
              json['result'] as Map<String, dynamic>),
    )
      ..errorCode = (json['error_code'] as num?)?.toInt()
      ..errorDesc = json['error_desc'] as String?;

Map<String, dynamic> _$VcDownloadTokenRespToJson(
        VcDownloadTokenResp instance) =>
    <String, dynamic>{
      'error_code': instance.errorCode,
      'error_desc': instance.errorDesc,
      'result': instance.result,
    };
