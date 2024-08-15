import 'package:freezed_annotation/freezed_annotation.dart';
import 'base-response.dart';
import 'block-number-result.dart';

part 'block-number-resp.g.dart';

@JsonSerializable(explicitToJson: true)
class BlockNumberResp extends BaseResponse {
  @JsonKey(name: "result")
  BlockNumberResult? result;

  BlockNumberResp({this.result});

  factory BlockNumberResp.fromJson(Map<String, dynamic> json) =>
      _$BlockNumberRespFromJson(json);

  Map<String, dynamic> toJson() => _$BlockNumberRespToJson(this);

  static BlockNumberResp fromJsonModel(Map<String, dynamic> json) =>
      BlockNumberResp.fromJson(json);
}
