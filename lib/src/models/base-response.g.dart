// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base-response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse<T> _$BaseResponseFromJson<T extends JsonSerializable>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    BaseResponse<T>(
      result: _$nullableGenericFromJson(json['result'], fromJsonT),
      errorCode: (json['error_code'] as num?)?.toInt(),
      errorDesc: json['error_desc'] as String?,
    );

Map<String, dynamic> _$BaseResponseToJson<T extends JsonSerializable>(
  BaseResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'result': _$nullableGenericToJson(instance.result, toJsonT),
      'error_code': instance.errorCode,
      'error_desc': instance.errorDesc,
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
