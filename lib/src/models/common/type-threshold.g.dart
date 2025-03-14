// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type-threshold.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TypeThreshold _$TypeThresholdFromJson(Map<String, dynamic> json) =>
    TypeThreshold(
      type: (json['type'] as num?)?.toInt(),
      threshold: (json['threshold'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TypeThresholdToJson(TypeThreshold instance) =>
    <String, dynamic>{
      'type': instance.type,
      'threshold': instance.threshold,
    };
