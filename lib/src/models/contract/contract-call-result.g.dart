// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract-call-result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContractCallResult _$ContractCallResultFromJson(Map<String, dynamic> json) =>
    ContractCallResult(
      logs: json['logs'],
      queryRets: (json['query_rets'] as List<dynamic>?)
          ?.map((e) => e as Object)
          .toList(),
    );

Map<String, dynamic> _$ContractCallResultToJson(ContractCallResult instance) =>
    <String, dynamic>{
      'logs': instance.logs,
      'query_rets': instance.queryRets,
    };
