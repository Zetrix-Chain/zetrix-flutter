// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction-sign-req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionSignReq _$TransactionSignReqFromJson(Map<String, dynamic> json) =>
    TransactionSignReq(
      blob: json['blob'] as String?,
      privateKeys: (json['private_keys'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$TransactionSignReqToJson(TransactionSignReq instance) =>
    <String, dynamic>{
      'blob': instance.blob,
      'private_keys': instance.privateKeys,
    };
