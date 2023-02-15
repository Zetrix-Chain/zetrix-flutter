// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create-account-entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateAccountEntity _$CreateAccountEntityFromJson(Map<String, dynamic> json) =>
    CreateAccountEntity(
      destAddress: json['dest_address'] as String?,
      priv: json['priv'] == null
          ? null
          : Priv.fromJson(json['priv'] as Map<String, dynamic>),
      metadatas: (json['metadatas'] as List<dynamic>?)
          ?.map((e) => Metadata.fromJson(e as Map<String, dynamic>))
          .toList(),
      contract: json['contract'] == null
          ? null
          : Contract.fromJson(json['contract'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateAccountEntityToJson(
        CreateAccountEntity instance) =>
    <String, dynamic>{
      'dest_address': instance.destAddress,
      'priv': instance.priv,
      'metadatas': instance.metadatas,
      'contract': instance.contract,
    };
