import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zetrix_flutter/src/models/vc/qr/vc-qr-blob-result.dart';

import '../../base-response.dart';

part 'vc-qr-token-resp.g.dart';

@JsonSerializable()
class VcQrTokenResp extends BaseResponse {
  @JsonKey(name: "result")
  VcQrBlobResult? result;

  VcQrTokenResp({this.result});

  factory VcQrTokenResp.fromJson(Map<String, dynamic> json) =>
      _$VcQrTokenRespFromJson(json);

  Map<String, dynamic> toJson() => _$VcQrTokenRespToJson(this);

  static VcQrTokenResp fromJsonModel(Map<String, dynamic> json) =>
      VcQrTokenResp.fromJson(json);
}
