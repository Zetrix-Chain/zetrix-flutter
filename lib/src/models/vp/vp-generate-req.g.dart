// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vp-generate-req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VpGenerateReq _$VpGenerateReqFromJson(Map<String, dynamic> json) =>
    VpGenerateReq(
      holder: json['holder'] as String?,
      finalizedVc: json['finalizedVc'] as String?,
      jws: json['jws'] as String?,
    );

Map<String, dynamic> _$VpGenerateReqToJson(VpGenerateReq instance) =>
    <String, dynamic>{
      'holder': instance.holder,
      'finalizedVc': instance.finalizedVc,
      'jws': instance.jws,
    };
