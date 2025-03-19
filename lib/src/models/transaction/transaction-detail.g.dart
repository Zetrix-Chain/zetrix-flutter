// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction-detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionDetail _$TransactionDetailFromJson(Map<String, dynamic> json) =>
    TransactionDetail(
      feeLimit: (json['fee_limit'] as num?)?.toInt(),
      gasPrice: (json['gas_price'] as num?)?.toInt(),
      nonce: (json['nonce'] as num?)?.toInt(),
      operations: (json['operations'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      sourceAddress: json['source_address'] as String?,
    );

Map<String, dynamic> _$TransactionDetailToJson(TransactionDetail instance) =>
    <String, dynamic>{
      'fee_limit': instance.feeLimit,
      'gas_price': instance.gasPrice,
      'nonce': instance.nonce,
      'operations': instance.operations,
      'source_address': instance.sourceAddress,
    };
