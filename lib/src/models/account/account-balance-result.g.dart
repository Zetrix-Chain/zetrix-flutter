// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account-balance-result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountBalanceResult _$AccountBalanceResultFromJson(
        Map<String, dynamic> json) =>
    AccountBalanceResult(
      balance: (json['balance'] as num?)?.toInt(),
    )
      ..errorCode = (json['error_code'] as num?)?.toInt()
      ..errorDesc = json['error_desc'] as String?;

Map<String, dynamic> _$AccountBalanceResultToJson(
        AccountBalanceResult instance) =>
    <String, dynamic>{
      'error_code': instance.errorCode,
      'error_desc': instance.errorDesc,
      'balance': instance.balance,
    };
