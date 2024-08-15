// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thresholds.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Thresholds _$ThresholdsFromJson(Map<String, dynamic> json) => Thresholds(
      txThreshold: (json['tx_threshold'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ThresholdsToJson(Thresholds instance) =>
    <String, dynamic>{
      'tx_threshold': instance.txThreshold,
    };
