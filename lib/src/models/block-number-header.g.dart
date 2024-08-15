// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'block-number-header.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlockNumberHeader _$BlockNumberHeaderFromJson(Map<String, dynamic> json) =>
    BlockNumberHeader(
      blockNumber: (json['seq'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BlockNumberHeaderToJson(BlockNumberHeader instance) =>
    <String, dynamic>{
      'seq': instance.blockNumber,
    };
