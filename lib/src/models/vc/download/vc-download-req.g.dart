// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vc-download-req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VcDownloadReq _$VcDownloadReqFromJson(Map<String, dynamic> json) =>
    VcDownloadReq(
      credentialId: json['credentialId'] as String?,
    )..userAddress = json['userAddress'] as String?;

Map<String, dynamic> _$VcDownloadReqToJson(VcDownloadReq instance) =>
    <String, dynamic>{
      'credentialId': instance.credentialId,
      'userAddress': instance.userAddress,
    };
