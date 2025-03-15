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
    );

Map<String, dynamic> _$VpGenerateRespToJson(VpGenerateResp instance) =>
    <String, dynamic>{
      'vp': instance.vp,
    };
