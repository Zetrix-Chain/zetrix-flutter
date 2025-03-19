// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transaction _$TransactionFromJson(Map<String, dynamic> json) => Transaction(
      actualFee: (json['actual_fee'] as num?)?.toInt(),
      closeTime: (json['close_time'] as num?)?.toInt(),
      contractTxHashes: (json['contract_tx_hashes'] as num?)?.toInt(),
      errorCode: (json['error_code'] as num?)?.toInt(),
      errorDesc: json['error_desc'] as String?,
      transaction: json['transaction'] == null
          ? null
          : TransactionDetail.fromJson(json['transaction']),
      hash: json['hash'] as String?,
      ledgerSeq: (json['ledger_seq'] as num?)?.toInt(),
      signatures: (json['signatures'] as List<dynamic>?)
          ?.map((e) => Signature.fromJson(e as Map<String, dynamic>))
          .toList(),
      txSize: (json['tx_size'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'actual_fee': instance.actualFee,
      'close_time': instance.closeTime,
      'contract_tx_hashes': instance.contractTxHashes,
      'error_code': instance.errorCode,
      'error_desc': instance.errorDesc,
      'hash': instance.hash,
      'ledger_seq': instance.ledgerSeq,
      'signatures': instance.signatures?.map((e) => e.toJson()).toList(),
      'transaction': instance.transaction?.toJson(),
      'tx_size': instance.txSize,
    };
