import 'package:freezed_annotation/freezed_annotation.dart';

part 'vc-qr-blob-result.g.dart';

@JsonSerializable()
class VcQrBlobResult {
  @JsonKey(name: "blobId")
  String? blobId;

  @JsonKey(name: "blob")
  String? blob;

  VcQrBlobResult({
    this.blobId, 
    this.blob
  });

  factory VcQrBlobResult.fromJson(Map<String, dynamic> json) =>
      _$VcQrBlobResultFromJson(json);

  Map<String, dynamic> toJson() => _$VcQrBlobResultToJson(this);

  static VcQrBlobResult fromJsonModel(Map<String, dynamic> json) =>
      VcQrBlobResult.fromJson(json);
}
