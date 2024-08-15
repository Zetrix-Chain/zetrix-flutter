// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vc-info-resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VcInfoResp _$VcInfoRespFromJson(Map<String, dynamic> json) => VcInfoResp(
      pageSize: (json['pageSize'] as num?)?.toInt(),
      pageStart: (json['pageStart'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toInt(),
      rows: (json['rows'] as List<dynamic>?)
          ?.map((e) => VcDetailEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VcInfoRespToJson(VcInfoResp instance) =>
    <String, dynamic>{
      'pageSize': instance.pageSize,
      'pageStart': instance.pageStart,
      'total': instance.total,
      'rows': instance.rows,
    };
