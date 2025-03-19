// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base-response-submit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponseSubmit _$BaseResponseSubmitFromJson(Map<String, dynamic> json) =>
    BaseResponseSubmit(
      results: (json['results'] as List<dynamic>?)
          ?.map((e) =>
              TransactionSubmitBlobResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      successCount: (json['success_count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BaseResponseSubmitToJson(BaseResponseSubmit instance) =>
    <String, dynamic>{
      'results': instance.results?.map((e) => e.toJson()).toList(),
      'success_count': instance.successCount,
    };
