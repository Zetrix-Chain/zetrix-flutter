import 'package:freezed_annotation/freezed_annotation.dart';

import 'base-response.dart';

part 'transaction-info-resp.g.dart';

@JsonSerializable()
class TransactionInfoResp extends BaseResponse {
  @JsonKey(name: "result")
  Map<String, dynamic>? result;

  TransactionInfoResp({this.result});

  factory TransactionInfoResp.fromJson(Map<String, dynamic> json) =>
      _$TransactionInfoRespFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionInfoRespToJson(this);

  static TransactionInfoResp fromJsonModel(Map<String, dynamic> json) =>
      TransactionInfoResp.fromJson(json);
}
