// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vc-download-blob-resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VcDownloadBlobResp _$VcDownloadBlobRespFromJson(Map<String, dynamic> json) =>
    VcDownloadBlobResp(
      result: json['result'] == null
          ? null
          : VcDownloadBlobResult.fromJson(
              json['result'] as Map<String, dynamic>),
    )
      ..errorCode = (json['error_code'] as num?)?.toInt()
      ..errorDesc = json['error_desc'] as String?;

Map<String, dynamic> _$VcDownloadBlobRespToJson(VcDownloadBlobResp instance) =>
    <String, dynamic>{
      'error_code': instance.errorCode,
      'error_desc': instance.errorDesc,
      'result': instance.result,
    };
