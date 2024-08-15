// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vc-download-result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VcDownloadResult _$VcDownloadResultFromJson(Map<String, dynamic> json) =>
    VcDownloadResult(
      jws: json['jws'] as String?,
      vcId: json['vcId'] as String?,
      vc: json['vc'] as String?,
      issuerBid: json['issuerBid'] as String?,
      issuerAddress: json['issuerAddress'] as String?,
      isDownload: (json['isDownload'] as num?)?.toInt(),
    );

Map<String, dynamic> _$VcDownloadResultToJson(VcDownloadResult instance) =>
    <String, dynamic>{
      'jws': instance.jws,
      'vcId': instance.vcId,
      'vc': instance.vc,
      'issuerBid': instance.issuerBid,
      'issuerAddress': instance.issuerAddress,
      'isDownload': instance.isDownload,
    };
