// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vc-generateqr-req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VcGenerateQrReq _$VcGenerateQrReqFromJson(Map<String, dynamic> json) =>
    VcGenerateQrReq(
      blobId: json['blobId'] as String?,
      signBlob: json['signBlob'] as String?,
      publicKey: json['publicKey'] as String?,
      userAddress: json['userAddress'] as String?,
    );

Map<String, dynamic> _$VcGenerateQrReqToJson(VcGenerateQrReq instance) =>
    <String, dynamic>{
      'blobId': instance.blobId,
      'signBlob': instance.signBlob,
      'publicKey': instance.publicKey,
      'userAddress': instance.userAddress,
    };
