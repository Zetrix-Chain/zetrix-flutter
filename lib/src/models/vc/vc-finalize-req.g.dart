// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vc-finalize-req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VcFinalizeReq _$VcFinalizeReqFromJson(Map<String, dynamic> json) =>
    VcFinalizeReq(
      vc: json['vc'] as String?,
      issuer: json['issuer'] as String?,
      vcjws: json['jws'] as String?,
    );

Map<String, dynamic> _$VcFinalizeReqToJson(VcFinalizeReq instance) =>
    <String, dynamic>{
      'vc': instance.vc,
      'issuer': instance.issuer,
      'jws': instance.vcjws,
    };
