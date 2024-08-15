// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vc-qr-token-resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VcQrTokenResp _$VcQrTokenRespFromJson(Map<String, dynamic> json) =>
    VcQrTokenResp(
      result: json['result'] == null
          ? null
          : VcQrBlobResult.fromJson(json['result'] as Map<String, dynamic>),
    )
      ..errorCode = (json['error_code'] as num?)?.toInt()
      ..errorDesc = json['error_desc'] as String?;

Map<String, dynamic> _$VcQrTokenRespToJson(VcQrTokenResp instance) =>
    <String, dynamic>{
      'error_code': instance.errorCode,
      'error_desc': instance.errorDesc,
      'result': instance.result,
    };
