// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vc-qr-token-req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VcQrTokenReq _$VcQrTokenReqFromJson(Map<String, dynamic> json) => VcQrTokenReq(
      chainType: json['chainType'] as String?,
      blob: json['blob'] as String?,
      signBlob: json['signBlob'] as String?,
      publicKey: json['publicKey'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$VcQrTokenReqToJson(VcQrTokenReq instance) =>
    <String, dynamic>{
      'chainType': instance.chainType,
      'blob': instance.blob,
      'signBlob': instance.signBlob,
      'publicKey': instance.publicKey,
      'address': instance.address,
    };
