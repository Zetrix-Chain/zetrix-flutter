import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zetrix_flutter/src/models/vc/qr/vc-generateqr-result.dart';

import '../../base-response.dart';

part 'vc-generateqr-resp.g.dart';

@JsonSerializable()
class VcGenerateQrResp extends BaseResponse {
  @JsonKey(name: "result")
  VcGenerateQrResult? result;

  VcGenerateQrResp({this.result});

  factory VcGenerateQrResp.fromJson(Map<String, dynamic> json) =>
      _$VcGenerateQrRespFromJson(json);

  Map<String, dynamic> toJson() => _$VcGenerateQrRespToJson(this);

  static VcGenerateQrResp fromJsonModel(Map<String, dynamic> json) =>
      VcGenerateQrResp.fromJson(json);
}
