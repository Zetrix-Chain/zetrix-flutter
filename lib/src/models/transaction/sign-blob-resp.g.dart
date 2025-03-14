// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign-blob-resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignBlobResp _$SignBlobRespFromJson(Map<String, dynamic> json) => SignBlobResp(
      signBlob: json['signBlob'] as String?,
      publicKey: json['publicKey'] as String?,
    )
      ..errorCode = (json['error_code'] as num?)?.toInt()
      ..errorDesc = json['error_desc'] as String?;

Map<String, dynamic> _$SignBlobRespToJson(SignBlobResp instance) =>
    <String, dynamic>{
      'error_code': instance.errorCode,
      'error_desc': instance.errorDesc,
      'signBlob': instance.signBlob,
      'publicKey': instance.publicKey,
    };
