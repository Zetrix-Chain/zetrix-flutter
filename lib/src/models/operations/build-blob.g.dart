// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'build-blob.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BuildBlob<T> _$BuildBlobFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    BuildBlob<T>(
      sourceAddress: json['source_address'] as String?,
      nonce: json['nonce'] as int?,
      feeLimit: json['fee_limit'] as int?,
      gasPrice: json['gas_price'] as int?,
      operations:
          (json['operations'] as List<dynamic>?)?.map(fromJsonT).toList(),
    );

Map<String, dynamic> _$BuildBlobToJson<T>(
  BuildBlob<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'source_address': instance.sourceAddress,
      'nonce': instance.nonce,
      'fee_limit': instance.feeLimit,
      'gas_price': instance.gasPrice,
      'operations': instance.operations?.map(toJsonT).toList(),
    };
