import 'package:freezed_annotation/freezed_annotation.dart';

import 'base-operation.dart';

part 'transaction-build-blob-req.g.dart';

@JsonSerializable()
class TransactionBuildBlobReq {

  @JsonKey(name: "source_address")
  String? sourceAddress;

  @JsonKey(name: "nonce")
  int? nonce;

  @JsonKey(name: "gas_price")
  int? gasPrice;

  @JsonKey(name: "fee_limit")
  int? feeLimit;

  @JsonKey(name: "operations")
  List<BaseOperation>? operations;

  @JsonKey(name: "ceil_ledger_seq")
  int? ceilLedgerSeq;

  @JsonKey(name: "metadata")
  String? metadata;

  TransactionBuildBlobReq(
      {this.sourceAddress,
      this.gasPrice,
      this.feeLimit,
      this.nonce,
      this.ceilLedgerSeq,
      this.operations,
      this.metadata});

  factory TransactionBuildBlobReq.fromJson(Map<String, dynamic> json) =>
      _$TransactionBuildBlobReqFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionBuildBlobReqToJson(this);

  static TransactionBuildBlobReq fromJsonModel(Map<String, dynamic> json) =>
      TransactionBuildBlobReq.fromJson(json);
}
