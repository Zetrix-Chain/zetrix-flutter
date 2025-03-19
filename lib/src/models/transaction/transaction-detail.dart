import 'package:json_annotation/json_annotation.dart';
import 'package:zetrix_flutter/src/models/chain/operation.dart';
import 'package:zetrix_flutter/src/models/common/signature.dart';

part 'transaction-detail.g.dart';

@JsonSerializable(explicitToJson: true)
class TransactionDetail extends JsonSerializable {
  @JsonKey(name: "fee_limit")
  int? feeLimit;

  @JsonKey(name: "gas_price")
  int? gasPrice;

  @JsonKey(name: "nonce")
  int? nonce;

  @JsonKey(name: "operations")
  List<Map<String, dynamic>>? operations;

  @JsonKey(name: "source_address")
  String? sourceAddress;

  TransactionDetail(
      {this.feeLimit,
      this.gasPrice,
      this.nonce,
      this.operations,
      this.sourceAddress});

  factory TransactionDetail.fromJson(json) => _$TransactionDetailFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionDetailToJson(this);
}
