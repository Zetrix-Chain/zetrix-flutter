// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'priv.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Priv _$PrivFromJson(Map<String, dynamic> json) => Priv(
      thresholds: json['thresholds'] == null
          ? null
          : Thresholds.fromJson(json['thresholds'] as Map<String, dynamic>),
      masterWeight: (json['master_weight'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PrivToJson(Priv instance) => <String, dynamic>{
      'thresholds': instance.thresholds?.toJson(),
      'master_weight': instance.masterWeight,
    };
