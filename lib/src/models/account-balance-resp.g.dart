// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account-balance-resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountBalanceResp _$AccountBalanceRespFromJson(Map<String, dynamic> json) =>
    AccountBalanceResp(
      result: json['result'] == null
          ? null
          : AccountBalanceResult.fromJson(
              json['result'] as Map<String, dynamic>),
    )
      ..errorCode = (json['error_code'] as num?)?.toInt()
      ..errorDesc = json['error_desc'] as String?;

Map<String, dynamic> _$AccountBalanceRespToJson(AccountBalanceResp instance) =>
    <String, dynamic>{
      'error_code': instance.errorCode,
      'error_desc': instance.errorDesc,
      'result': instance.result?.toJson(),
    };
