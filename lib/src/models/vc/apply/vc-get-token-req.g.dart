// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vc-get-token-req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VcGetTokenReq _$VcGetTokenReqFromJson(Map<String, dynamic> json) =>
    VcGetTokenReq(
      blobId: json['blobId'] as String?,
      blobSign: json['blobSign'] as String?,
      publicKey: json['publicKey'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$VcGetTokenReqToJson(VcGetTokenReq instance) =>
    <String, dynamic>{
      'blobId': instance.blobId,
      'blobSign': instance.blobSign,
      'publicKey': instance.publicKey,
      'address': instance.address,
    };
