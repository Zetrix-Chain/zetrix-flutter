// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vc-get-token-resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VcGetTokenResp _$VcGetTokenRespFromJson(Map<String, dynamic> json) =>
    VcGetTokenResp(
      result: json['result'] == null
          ? null
          : VcGetTokenResult.fromJson(json['result'] as Map<String, dynamic>),
    )
      ..errorCode = (json['error_code'] as num?)?.toInt()
      ..errorDesc = json['error_desc'] as String?;

Map<String, dynamic> _$VcGetTokenRespToJson(VcGetTokenResp instance) =>
    <String, dynamic>{
      'error_code': instance.errorCode,
      'error_desc': instance.errorDesc,
      'result': instance.result,
    };
