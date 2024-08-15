// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vc-download-token-req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VcDownloadTokenReq _$VcDownloadTokenReqFromJson(Map<String, dynamic> json) =>
    VcDownloadTokenReq(
      blob: json['blob'] as String?,
      signBlob: json['signBlob'] as String?,
      publicKey: json['publicKey'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$VcDownloadTokenReqToJson(VcDownloadTokenReq instance) =>
    <String, dynamic>{
      'signBlob': instance.signBlob,
      'publicKey': instance.publicKey,
      'address': instance.address,
      'blob': instance.blob,
    };
