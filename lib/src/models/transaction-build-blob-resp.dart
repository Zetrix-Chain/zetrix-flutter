import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zetrix_flutter/src/models/transaction-build-blob-result.dart';

import 'base-response.dart';

part 'transaction-build-blob-resp.g.dart';

@JsonSerializable()
class TransactionBuildBlobResp extends BaseResponse {
  @JsonKey(name: "result")
  TransactionBuildBlobResult? result;

  TransactionBuildBlobResp({this.result});

  factory TransactionBuildBlobResp.fromJson(Map<String, dynamic> json) =>
      _$TransactionBuildBlobRespFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionBuildBlobRespToJson(this);

  static TransactionBuildBlobResp fromJsonModel(Map<String, dynamic> json) =>
      TransactionBuildBlobResp.fromJson(json);
}
