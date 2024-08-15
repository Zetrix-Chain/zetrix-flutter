import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zetrix_flutter/src/models/vc/apply/vc-get-blob-result.dart';

import '../../base-response.dart';

part 'vc-get-blob-resp.g.dart';

@JsonSerializable()
class VcGetBlobResp extends BaseResponse {
  @JsonKey(name: "result")
  VcGetBlobResult? result;

  VcGetBlobResp({this.result});

  factory VcGetBlobResp.fromJson(Map<String, dynamic> json) =>
      _$VcGetBlobRespFromJson(json);

  Map<String, dynamic> toJson() => _$VcGetBlobRespToJson(this);

  static VcGetBlobResp fromJsonModel(Map<String, dynamic> json) =>
      VcGetBlobResp.fromJson(json);
}
