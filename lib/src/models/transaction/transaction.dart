import 'package:json_annotation/json_annotation.dart';
import 'package:zetrix_flutter/src/models/common/signature.dart';
import 'package:zetrix_flutter/src/models/transaction/transaction-detail.dart';

part 'transaction.g.dart';

@JsonSerializable(explicitToJson: true)
class Transaction extends JsonSerializable {
  @JsonKey(name: "actual_fee")
  int? actualFee;

  @JsonKey(name: "close_time")
  int? closeTime;

  @JsonKey(name: "contract_tx_hashes")
  int? contractTxHashes;

  @JsonKey(name: "error_code")
  int? errorCode;

  @JsonKey(name: "error_desc")
  String? errorDesc;

  @JsonKey(name: "hash")
  String? hash;

  @JsonKey(name: "ledger_seq")
  int? ledgerSeq;

  @JsonKey(name: "signatures")
  List<Signature>? signatures;

  @JsonKey(name: "transaction")
  TransactionDetail? transaction;

  @JsonKey(name: "tx_size")
  int? txSize;

  Transaction(
      {this.actualFee,
      this.closeTime,
      this.contractTxHashes,
      this.errorCode,
      this.errorDesc,
      this.transaction,
      this.hash,
      this.ledgerSeq,
      this.signatures,
      this.txSize});

  factory Transaction.fromJson(json) => _$TransactionFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionToJson(this);
}
