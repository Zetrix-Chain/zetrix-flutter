// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction-submit-blob-item-req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionSubmitBlobItemReq _$TransactionSubmitBlobItemReqFromJson(
        Map<String, dynamic> json) =>
    TransactionSubmitBlobItemReq(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) =>
              TransactionSubmitBlobReq.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TransactionSubmitBlobItemReqToJson(
        TransactionSubmitBlobItemReq instance) =>
    <String, dynamic>{
      'items': instance.items,
    };
