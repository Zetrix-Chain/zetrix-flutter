// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction-evaluate-fee-req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionEvaluateFeeRequest _$TransactionEvaluateFeeRequestFromJson(
        Map<String, dynamic> json) =>
    TransactionEvaluateFeeRequest(
      sourceAddress: json['source_address'] as String?,
      nonce: (json['nonce'] as num?)?.toInt(),
      operations: (json['operations'] as List<dynamic>?)
          ?.map((e) => BaseOperation.fromJson(e as Map<String, dynamic>))
          .toList(),
      signatureNumber: (json['signature_number'] as num?)?.toInt(),
      ceilLedgerSeq: (json['ceil_ledger_seq'] as num?)?.toInt(),
      metadata: json['metadata'] as String?,
    );

Map<String, dynamic> _$TransactionEvaluateFeeRequestToJson(
        TransactionEvaluateFeeRequest instance) =>
    <String, dynamic>{
      'source_address': instance.sourceAddress,
      'nonce': instance.nonce,
      'operations': instance.operations,
      'signature_number': instance.signatureNumber,
      'ceil_ledger_seq': instance.ceilLedgerSeq,
      'metadata': instance.metadata,
    };
