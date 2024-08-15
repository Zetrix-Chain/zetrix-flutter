// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vc-get-blob-resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VcGetBlobResp _$VcGetBlobRespFromJson(Map<String, dynamic> json) =>
    VcGetBlobResp(
      result: json['result'] == null
          ? null
          : VcGetBlobResult.fromJson(json['result'] as Map<String, dynamic>),
    )
      ..errorCode = (json['error_code'] as num?)?.toInt()
      ..errorDesc = json['error_desc'] as String?;

Map<String, dynamic> _$VcGetBlobRespToJson(VcGetBlobResp instance) =>
    <String, dynamic>{
      'error_code': instance.errorCode,
      'error_desc': instance.errorDesc,
      'result': instance.result,
    };
