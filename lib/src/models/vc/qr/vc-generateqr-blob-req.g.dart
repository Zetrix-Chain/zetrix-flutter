// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vc-generateqr-blob-req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VcGenerateQrBlobReq _$VcGenerateQrBlobReqFromJson(Map<String, dynamic> json) =>
    VcGenerateQrBlobReq(
      userAddress: json['userAddress'] as String?,
      jws: json['jws'] as String?,
      contentAssert: json['contentAssert'] as String?,
      vcId: json['vcId'] as String?,
    );

Map<String, dynamic> _$VcGenerateQrBlobReqToJson(
        VcGenerateQrBlobReq instance) =>
    <String, dynamic>{
      'userAddress': instance.userAddress,
      'jws': instance.jws,
      'contentAssert': instance.contentAssert,
      'vcId': instance.vcId,
    };
