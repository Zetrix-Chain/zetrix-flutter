// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction-info-result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionInfoResult _$TransactionInfoResultFromJson(
        Map<String, dynamic> json) =>
    TransactionInfoResult(
      totalCount: (json['total_count'] as num?)?.toInt(),
      transactions: (json['transactions'] as List<dynamic>?)
          ?.map(Transaction.fromJson)
          .toList(),
    );

Map<String, dynamic> _$TransactionInfoResultToJson(
        TransactionInfoResult instance) =>
    <String, dynamic>{
      'total_count': instance.totalCount,
      'transactions': instance.transactions,
    };
