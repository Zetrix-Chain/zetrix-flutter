import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zetrix_flutter/src/models/vc/download/vc-download-result.dart';

import '../../base-response.dart';

part 'vc-download-resp.g.dart';

@JsonSerializable()
class VcDownloadResp extends BaseResponse {
  @JsonKey(name: "result")
  VcDownloadResult? result;

  VcDownloadResp({this.result});

  factory VcDownloadResp.fromJson(Map<String, dynamic> json) =>
      _$VcDownloadRespFromJson(json);

  Map<String, dynamic> toJson() => _$VcDownloadRespToJson(this);

  static VcDownloadResp fromJsonModel(Map<String, dynamic> json) =>
      VcDownloadResp.fromJson(json);
}
