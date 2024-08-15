import 'package:freezed_annotation/freezed_annotation.dart';

part 'vc-download-token-result.g.dart';

@JsonSerializable()
class VcDownloadTokenResult {

  @JsonKey(name: "accessToken")
  String? accessToken;

  VcDownloadTokenResult({
      this.accessToken
  });

  factory VcDownloadTokenResult.fromJson(Map<String, dynamic> json) =>
      _$VcDownloadTokenResultFromJson(json);

  Map<String, dynamic> toJson() => _$VcDownloadTokenResultToJson(this);

  static VcDownloadTokenResult fromJsonModel(Map<String, dynamic> json) =>
      VcDownloadTokenResult.fromJson(json);
}
