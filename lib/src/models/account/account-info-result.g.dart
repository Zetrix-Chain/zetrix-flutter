// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account-info-result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountInfo _$AccountInfoFromJson(Map<String, dynamic> json) => AccountInfo(
      address: json['address'] as String?,
      assets: json['assets'] as String?,
      assetsHash: json['assets_hash'] as String?,
      balance: (json['balance'] as num?)?.toInt(),
      metadatas: json['metadatas'] as String?,
      metadatasHash: json['metadatas_hash'] as String?,
      nonce: (json['nonce'] as num?)?.toInt(),
      priv: json['priv'] == null
          ? null
          : Priv.fromJson(json['priv'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AccountInfoToJson(AccountInfo instance) =>
    <String, dynamic>{
      'address': instance.address,
      'assets': instance.assets,
      'assets_hash': instance.assetsHash,
      'balance': instance.balance,
      'metadatas': instance.metadatas,
      'metadatas_hash': instance.metadatasHash,
      'nonce': instance.nonce,
      'priv': instance.priv?.toJson(),
    };
