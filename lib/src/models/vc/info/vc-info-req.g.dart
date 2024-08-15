// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vc-info-req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VcInfoReq _$VcInfoReqFromJson(Map<String, dynamic> json) => VcInfoReq(
      name: json['name'] as String?,
      userAddress: json['userAddress'] as String?,
      pageStart: (json['pageStart'] as num?)?.toInt(),
      pageSize: (json['pageSize'] as num?)?.toInt(),
      status: (json['status'] as num?)?.toInt(),
    );

Map<String, dynamic> _$VcInfoReqToJson(VcInfoReq instance) => <String, dynamic>{
      'name': instance.name,
      'userAddress': instance.userAddress,
      'status': instance.status,
      'pageStart': instance.pageStart,
      'pageSize': instance.pageSize,
    };
