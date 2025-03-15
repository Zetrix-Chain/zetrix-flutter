// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account-balance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountBalance _$AccountBalanceFromJson(Map<String, dynamic> json) =>
    AccountBalance(
      balance: (json['balance'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AccountBalanceToJson(AccountBalance instance) =>
    <String, dynamic>{
      'balance': instance.balance,
    };
