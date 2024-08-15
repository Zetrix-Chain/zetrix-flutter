import 'package:freezed_annotation/freezed_annotation.dart';

part 'vc-download-blob-result.g.dart';

@JsonSerializable()
class VcDownloadBlobResult {

  @JsonKey(name: "blob")
  String? blob;

  VcDownloadBlobResult({
      this.blob
  });

  factory VcDownloadBlobResult.fromJson(Map<String, dynamic> json) =>
      _$VcDownloadBlobResultFromJson(json);

  Map<String, dynamic> toJson() => _$VcDownloadBlobResultToJson(this);

  static VcDownloadBlobResult fromJsonModel(Map<String, dynamic> json) =>
      VcDownloadBlobResult.fromJson(json);
}
