// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract-call-req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContractCallReq _$ContractCallReqFromJson(Map<String, dynamic> json) =>
    ContractCallReq(
      sourceAddress: json['source_address'] as String?,
      contractAddress: json['contract_address'] as String?,
      code: json['code'] as String?,
      input: json['input'] as String?,
      contractBalance: (json['contract_balance'] as num?)?.toInt(),
      optType: (json['opt_type'] as num?)?.toInt(),
      feeLimit: (json['fee_limit'] as num?)?.toInt(),
      gasPrice: (json['gas_price'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ContractCallReqToJson(ContractCallReq instance) =>
    <String, dynamic>{
      'source_address': instance.sourceAddress,
      'contract_address': instance.contractAddress,
      'code': instance.code,
      'input': instance.input,
      'contract_balance': instance.contractBalance,
      'opt_type': instance.optType,
      'fee_limit': instance.feeLimit,
      'gas_price': instance.gasPrice,
    };
