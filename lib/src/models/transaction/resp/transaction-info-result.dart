import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zetrix_flutter/src/models/transaction/transaction.dart';

part 'transaction-info-result.g.dart';

@JsonSerializable()
class TransactionInfoResult extends JsonSerializable {
  @JsonKey(name: "total_count")
  int? totalCount;

  @JsonKey(name: "transactions")
  List<Transaction>? transactions;

  TransactionInfoResult({this.totalCount, this.transactions});

  factory TransactionInfoResult.fromJson(Map<String, dynamic> json) =>
      _$TransactionInfoResultFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionInfoResultToJson(this);

  static TransactionInfoResult fromJsonModel(Map<String, dynamic> json) =>
      TransactionInfoResult.fromJson(json);
}
