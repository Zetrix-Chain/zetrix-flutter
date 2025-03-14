// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'build-blob.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BuildBlob _$BuildBlobFromJson(Map<String, dynamic> json) => BuildBlob(
      sourceAddress: json['source_address'] as String?,
      nonce: (json['nonce'] as num?)?.toInt(),
      feeLimit: (json['fee_limit'] as num?)?.toInt(),
      gasPrice: (json['gas_price'] as num?)?.toInt(),
      operations: (json['operations'] as List<dynamic>?)
          ?.map((e) => Operation<JsonSerializable>.fromJson(
              e as Map<String, dynamic>,
              (value) =>
                  JsonSerializable.fromJson(value as Map<String, dynamic>)))
          .toList(),
    );

Map<String, dynamic> _$BuildBlobToJson(BuildBlob instance) => <String, dynamic>{
      'source_address': instance.sourceAddress,
      'nonce': instance.nonce,
      'fee_limit': instance.feeLimit,
      'gas_price': instance.gasPrice,
      'operations': instance.operations
          ?.map((e) => e.toJson(
                (value) => value.toJson(),
              ))
          .toList(),
    };
