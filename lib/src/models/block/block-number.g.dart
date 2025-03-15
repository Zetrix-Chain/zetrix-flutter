// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'block-number.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlockNumber _$BlockNumberFromJson(Map<String, dynamic> json) => BlockNumber(
      header: json['header'] == null
          ? null
          : BlockNumberHeader.fromJson(json['header'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BlockNumberToJson(BlockNumber instance) =>
    <String, dynamic>{
      'header': instance.header?.toJson(),
    };
