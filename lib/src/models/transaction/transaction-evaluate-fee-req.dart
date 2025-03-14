import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zetrix_flutter/src/models/operations/base-operation.dart';

part 'transaction-evaluate-fee-req.g.dart';

@JsonSerializable()
class TransactionEvaluateFeeRequest {
  @JsonKey(name: "source_address")
  String? sourceAddress;

  @JsonKey(name: "nonce")
  int? nonce;

  @JsonKey(name: "operations")
  List<BaseOperation>? operations;

  @JsonKey(name: "signature_number")
  int? signatureNumber = 1;

  @JsonKey(name: "ceil_ledger_seq")
  int? ceilLedgerSeq;

  @JsonKey(name: "metadata")
  String? metadata;

  TransactionEvaluateFeeRequest(
      {this.sourceAddress,
      this.nonce,
      this.operations,
      this.signatureNumber,
      this.ceilLedgerSeq,
      this.metadata});

  factory TransactionEvaluateFeeRequest.fromJson(Map<String, dynamic> json) =>
      _$TransactionEvaluateFeeRequestFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionEvaluateFeeRequestToJson(this);

  static TransactionEvaluateFeeRequest fromJsonModel(
          Map<String, dynamic> json) =>
      TransactionEvaluateFeeRequest.fromJson(json);
}
