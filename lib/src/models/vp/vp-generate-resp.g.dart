// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vp-generate-resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VpGenerateResp _$VpGenerateRespFromJson(Map<String, dynamic> json) =>
    VpGenerateResp(
      vp: json['vp'] == null
          ? null
          : VerifiablePresentation.fromJson(json['vp'] as Map<String, dynamic>),
    )
      ..errorCode = (json['error_code'] as num?)?.toInt()
      ..errorDesc = json['error_desc'] as String?;

Map<String, dynamic> _$VpGenerateRespToJson(VpGenerateResp instance) =>
    <String, dynamic>{
      'error_code': instance.errorCode,
      'error_desc': instance.errorDesc,
      'vp': instance.vp,
    };
