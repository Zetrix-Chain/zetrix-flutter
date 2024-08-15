import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zetrix_flutter/src/models/vc/qr/vc-qr-blob-result.dart';

import '../../base-response.dart';

part 'vc-qr-blob-resp.g.dart';

@JsonSerializable()
class VcQrBlobResp extends BaseResponse {
  @JsonKey(name: "result")
  VcQrBlobResult? result;

  VcQrBlobResp({this.result});

  factory VcQrBlobResp.fromJson(Map<String, dynamic> json) =>
      _$VcQrBlobRespFromJson(json);

  Map<String, dynamic> toJson() => _$VcQrBlobRespToJson(this);

  static VcQrBlobResp fromJsonModel(Map<String, dynamic> json) =>
      VcQrBlobResp.fromJson(json);
}
