import 'package:freezed_annotation/freezed_annotation.dart';

part 'vc-generateqr-result.g.dart';

@JsonSerializable()
class VcGenerateQrResult {
  @JsonKey(name: "qrCode")
  String? qrCode;

  VcGenerateQrResult({this.qrCode});

  factory VcGenerateQrResult.fromJson(Map<String, dynamic> json) =>
      _$VcGenerateQrResultFromJson(json);

  Map<String, dynamic> toJson() => _$VcGenerateQrResultToJson(this);

  static VcGenerateQrResult fromJsonModel(Map<String, dynamic> json) =>
      VcGenerateQrResult.fromJson(json);
}
