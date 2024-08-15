import 'package:freezed_annotation/freezed_annotation.dart';

part 'vc-get-token-result.g.dart';

@JsonSerializable()
class VcGetTokenResult {

  @JsonKey(name: "token")
  String? token;

  VcGetTokenResult(
      {this.token});

  factory VcGetTokenResult.fromJson(Map<String, dynamic> json) =>
      _$VcGetTokenResultFromJson(json);

  Map<String, dynamic> toJson() => _$VcGetTokenResultToJson(this);

  static VcGetTokenResult fromJsonModel(Map<String, dynamic> json) =>
      VcGetTokenResult.fromJson(json);
}
