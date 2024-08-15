// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vc-qr-blob-resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VcQrBlobResp _$VcQrBlobRespFromJson(Map<String, dynamic> json) => VcQrBlobResp(
      result: json['result'] == null
          ? null
          : VcQrBlobResult.fromJson(json['result'] as Map<String, dynamic>),
    )
      ..errorCode = (json['error_code'] as num?)?.toInt()
      ..errorDesc = json['error_desc'] as String?;

Map<String, dynamic> _$VcQrBlobRespToJson(VcQrBlobResp instance) =>
    <String, dynamic>{
      'error_code': instance.errorCode,
      'error_desc': instance.errorDesc,
      'result': instance.result,
    };
