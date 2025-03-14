// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'block-number-resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlockNumberResp _$BlockNumberRespFromJson(Map<String, dynamic> json) =>
    BlockNumberResp(
      result: json['result'] == null
          ? null
          : BlockNumberResult.fromJson(json['result'] as Map<String, dynamic>),
    )
      ..errorCode = (json['error_code'] as num?)?.toInt()
      ..errorDesc = json['error_desc'] as String?;

Map<String, dynamic> _$BlockNumberRespToJson(BlockNumberResp instance) =>
    <String, dynamic>{
      'error_code': instance.errorCode,
      'error_desc': instance.errorDesc,
      'result': instance.result?.toJson(),
    };
