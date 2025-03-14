import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zetrix_flutter/src/models/transaction/transaction-submit-blob-req.dart';

part 'transaction-submit-blob-item-req.g.dart';

@JsonSerializable()
class TransactionSubmitBlobItemReq {
  @JsonKey(name: "items")
  List<TransactionSubmitBlobReq>? items;

  TransactionSubmitBlobItemReq({this.items});

  factory TransactionSubmitBlobItemReq.fromJson(Map<String, dynamic> json) =>
      _$TransactionSubmitBlobItemReqFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionSubmitBlobItemReqToJson(this);

  static TransactionSubmitBlobItemReq fromJsonModel(
          Map<String, dynamic> json) =>
      TransactionSubmitBlobItemReq.fromJson(json);
}
