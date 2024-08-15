import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zetrix_flutter/src/models/vc/apply/vc-get-token-result.dart';

import '../../base-response.dart';

part 'vc-get-token-resp.g.dart';

@JsonSerializable()
class VcGetTokenResp extends BaseResponse {
  @JsonKey(name: "result")
  VcGetTokenResult? result;

  VcGetTokenResp({this.result});

  factory VcGetTokenResp.fromJson(Map<String, dynamic> json) =>
      _$VcGetTokenRespFromJson(json);

  Map<String, dynamic> toJson() => _$VcGetTokenRespToJson(this);

  static VcGetTokenResp fromJsonModel(Map<String, dynamic> json) =>
      VcGetTokenResp.fromJson(json);
}
