// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vc-register-submit-req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VcRegisterSubmitReq _$VcRegisterSubmitReqFromJson(Map<String, dynamic> json) =>
    VcRegisterSubmitReq(
      blobId: json['blobId'] as String?,
      blobSign: json['blobSign'] as String?,
      publicKey: json['publicKey'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$VcRegisterSubmitReqToJson(
        VcRegisterSubmitReq instance) =>
    <String, dynamic>{
      'blobId': instance.blobId,
      'blobSign': instance.blobSign,
      'publicKey': instance.publicKey,
      'address': instance.address,
    };
