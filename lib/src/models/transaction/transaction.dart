import 'package:json_annotation/json_annotation.dart';
import 'package:zetrix_flutter/src/models/common/signature.dart';

part 'transaction.g.dart';

@JsonSerializable(explicitToJson: true)
class Transaction {
  @JsonKey(name: "total_count")
  int? totalCount;

  @JsonKey(name: "actual_fee")
  int? actualFee;

  @JsonKey(name: "close_time")
  int? closeTime;

  @JsonKey(name: "contract_tx_hashes")
  int? contractTxHashes;

  @JsonKey(name: "error_code")
  int? errorCode;

  @JsonKey(name: "error_desc")
  int? errorDesc;

  @JsonKey(name: "hash")
  int? hash;

  @JsonKey(name: "ledger_seq")
  int? ledgerSeq;

  @JsonKey(name: "signatures")
  List<Signature>? signatures;

  @JsonKey(name: "tx_size")
  int? txSize;

  Transaction(
      {this.totalCount,
      this.actualFee,
      this.closeTime,
      this.contractTxHashes,
      this.errorCode,
      this.errorDesc,
      this.hash,
      this.ledgerSeq,
      this.signatures,
      this.txSize});

  factory Transaction.fromJson(json) => _$TransactionFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionToJson(this);
}
