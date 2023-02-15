// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction-build-blob-req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionBuildBlobReq _$TransactionBuildBlobReqFromJson(
        Map<String, dynamic> json) =>
    TransactionBuildBlobReq(
      sourceAddress: json['source_address'] as String?,
      gasPrice: json['gas_price'] as int?,
      feeLimit: json['fee_limit'] as int?,
      nonce: json['nonce'] as int?,
      ceilLedgerSeq: json['ceil_ledger_seq'] as int?,
      operations: (json['operations'] as List<dynamic>?)
          ?.map((e) => BaseOperation.fromJson(e as Map<String, dynamic>))
          .toList(),
      metadata: json['metadata'] as String?,
    );

Map<String, dynamic> _$TransactionBuildBlobReqToJson(
        TransactionBuildBlobReq instance) =>
    <String, dynamic>{
      'source_address': instance.sourceAddress,
      'nonce': instance.nonce,
      'gas_price': instance.gasPrice,
      'fee_limit': instance.feeLimit,
      'operations': instance.operations,
      'ceil_ledger_seq': instance.ceilLedgerSeq,
      'metadata': instance.metadata,
    };
