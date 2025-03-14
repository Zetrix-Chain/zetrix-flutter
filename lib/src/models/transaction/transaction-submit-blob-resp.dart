import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zetrix_flutter/src/models/transaction/transaction-submit-blob-result.dart';

import 'package:zetrix_flutter/src/models/base-response.dart';

part 'transaction-submit-blob-resp.g.dart';

@JsonSerializable()
class TransactionSubmitBlobResp extends BaseResponse {
  @JsonKey(name: "result")
  TransactionSubmitBlobResult? result;

  TransactionSubmitBlobResp({this.result});

  factory TransactionSubmitBlobResp.fromJson(Map<String, dynamic> json) =>
      _$TransactionSubmitBlobRespFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionSubmitBlobRespToJson(this);

  static TransactionSubmitBlobResp fromJsonModel(Map<String, dynamic> json) =>
      TransactionSubmitBlobResp.fromJson(json);
}
