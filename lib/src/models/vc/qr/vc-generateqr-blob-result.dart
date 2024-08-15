import 'package:freezed_annotation/freezed_annotation.dart';

part 'vc-generateqr-blob-result.g.dart';

@JsonSerializable()
class VcGenerateQrBlobResult {
  @JsonKey(name: "blobId")
  String? blobId;

  @JsonKey(name: "blob")
  String? blob;

  VcGenerateQrBlobResult({
    this.blob, 
    this.blobId
  });

  factory VcGenerateQrBlobResult.fromJson(Map<String, dynamic> json) =>
      _$VcGenerateQrBlobResultFromJson(json);

  Map<String, dynamic> toJson() => _$VcGenerateQrBlobResultToJson(this);

  static VcGenerateQrBlobResult fromJsonModel(Map<String, dynamic> json) =>
      VcGenerateQrBlobResult.fromJson(json);
}
