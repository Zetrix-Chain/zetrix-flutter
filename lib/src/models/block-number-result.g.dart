// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'block-number-result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlockNumberResult _$BlockNumberResultFromJson(Map<String, dynamic> json) =>
    BlockNumberResult(
      header: json['header'] == null
          ? null
          : BlockNumberHeader.fromJson(json['header'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BlockNumberResultToJson(BlockNumberResult instance) =>
    <String, dynamic>{
      'header': instance.header?.toJson(),
    };
