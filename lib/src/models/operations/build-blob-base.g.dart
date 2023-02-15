// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'build-blob-base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BuildBlobBase _$BuildBlobBaseFromJson(Map<String, dynamic> json) =>
    BuildBlobBase(
      sourceAddress: json['source_address'] as String?,
      nonce: json['nonce'] as int?,
      feeLimit: json['fee_limit'] as int?,
      gasPrice: json['gas_price'] as int?,
    );

Map<String, dynamic> _$BuildBlobBaseToJson(BuildBlobBase instance) =>
    <String, dynamic>{
      'source_address': instance.sourceAddress,
      'nonce': instance.nonce,
      'fee_limit': instance.feeLimit,
      'gas_price': instance.gasPrice,
    };
