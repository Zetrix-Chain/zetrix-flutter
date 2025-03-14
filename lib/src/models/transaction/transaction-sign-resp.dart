import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zetrix_flutter/src/models/transaction/transaction-submit-blob-result.dart';

import 'package:zetrix_flutter/src/models/base-response.dart';

part 'transaction-sign-resp.g.dart';

@JsonSerializable()
class TransactionSignResp extends BaseResponse {
  @JsonKey(name: "result")
  TransactionSubmitBlobResult? result;

  TransactionSignResp({this.result});

  factory TransactionSignResp.fromJson(Map<String, dynamic> json) =>
      _$TransactionSignRespFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionSignRespToJson(this);

  static TransactionSignResp fromJsonModel(Map<String, dynamic> json) =>
      TransactionSignResp.fromJson(json);
}
