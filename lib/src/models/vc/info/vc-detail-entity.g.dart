// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vc-detail-entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VcDetailEntity _$VcDetailEntityFromJson(Map<String, dynamic> json) =>
    VcDetailEntity(
      issuerBid: json['issuerBid'] as String?,
      vcId: json['vcId'] as String?,
      name: json['name'] as String?,
      status: json['status'] as String?,
      isSel: (json['isSel'] as num?)?.toInt(),
      isDownload: (json['isDownload'] as num?)?.toInt(),
      startTime: json['startTime'] as String?,
      endTime: json['endTime'] as String?,
    )..issuerName = json['issuerName'] as String?;

Map<String, dynamic> _$VcDetailEntityToJson(VcDetailEntity instance) =>
    <String, dynamic>{
      'issuerBid': instance.issuerBid,
      'issuerName': instance.issuerName,
      'vcId': instance.vcId,
      'name': instance.name,
      'status': instance.status,
      'isSel': instance.isSel,
      'isDownload': instance.isDownload,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
    };
