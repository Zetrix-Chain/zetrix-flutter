// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vc-generateqr-blob-result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VcGenerateQrBlobResult _$VcGenerateQrBlobResultFromJson(
        Map<String, dynamic> json) =>
    VcGenerateQrBlobResult(
      blob: json['blob'] as String?,
      blobId: json['blobId'] as String?,
    );

Map<String, dynamic> _$VcGenerateQrBlobResultToJson(
        VcGenerateQrBlobResult instance) =>
    <String, dynamic>{
      'blobId': instance.blobId,
      'blob': instance.blob,
    };
