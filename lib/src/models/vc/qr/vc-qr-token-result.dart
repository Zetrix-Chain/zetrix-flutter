import 'package:freezed_annotation/freezed_annotation.dart';

part 'vc-qr-token-result.g.dart';

@JsonSerializable()
class VcQrTokenResult {
  @JsonKey(name: "accessToken")
  String? accessToken;

  VcQrTokenResult({
    this.accessToken
  });

  factory VcQrTokenResult.fromJson(Map<String, dynamic> json) =>
      _$VcQrTokenResultFromJson(json);

  Map<String, dynamic> toJson() => _$VcQrTokenResultToJson(this);

  static VcQrTokenResult fromJsonModel(Map<String, dynamic> json) =>
      VcQrTokenResult.fromJson(json);
}
