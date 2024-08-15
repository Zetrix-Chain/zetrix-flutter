// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vc-general-resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VcGeneralResp<T> _$VcGeneralRespFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    VcGeneralResp<T>(
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
      errorCode: (json['errorCode'] as num?)?.toInt(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$VcGeneralRespToJson<T>(
  VcGeneralResp<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': _$nullableGenericToJson(instance.data, toJsonT),
      'errorCode': instance.errorCode,
      'message': instance.message,
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
