import 'package:freezed_annotation/freezed_annotation.dart';

part 'vc-get-blob-result.g.dart';

@JsonSerializable()
class VcGetBlobResult {

  @JsonKey(name: "blobId")
  String? blobId;

  @JsonKey(name: "blob")
  String? blob;

  VcGetBlobResult(
      {this.blobId,
      this.blob});

  factory VcGetBlobResult.fromJson(Map<String, dynamic> json) =>
      _$VcGetBlobResultFromJson(json);

  Map<String, dynamic> toJson() => _$VcGetBlobResultToJson(this);

  static VcGetBlobResult fromJsonModel(Map<String, dynamic> json) =>
      VcGetBlobResult.fromJson(json);
}
