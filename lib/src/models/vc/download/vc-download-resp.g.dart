// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vc-download-resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VcDownloadResp _$VcDownloadRespFromJson(Map<String, dynamic> json) =>
    VcDownloadResp(
      result: json['result'] == null
          ? null
          : VcDownloadResult.fromJson(json['result'] as Map<String, dynamic>),
    )
      ..errorCode = (json['error_code'] as num?)?.toInt()
      ..errorDesc = json['error_desc'] as String?;

Map<String, dynamic> _$VcDownloadRespToJson(VcDownloadResp instance) =>
    <String, dynamic>{
      'error_code': instance.errorCode,
      'error_desc': instance.errorDesc,
      'result': instance.result,
    };
