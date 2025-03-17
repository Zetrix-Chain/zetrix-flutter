import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zetrix_flutter/src/models/operations/base-operation.dart';

part 'contract-call-req.g.dart';

@JsonSerializable()
class ContractCallReq {
  @JsonKey(name: "source_address")
  String? sourceAddress;

  @JsonKey(name: "contract_address")
  String? contractAddress;

  @JsonKey(name: "code")
  String? code;

  @JsonKey(name: "input")
  String? input;

  @JsonKey(name: "contract_balance")
  int? contractBalance;

  /*
   0: init - call the contract's read-write interface
   1: main - call the contract's read-write interface
   2: query - call the read-only interface
   */
  @JsonKey(name: "opt_type")
  int? optType;

  @JsonKey(name: "fee_limit")
  int? feeLimit;

  @JsonKey(name: "gas_price")
  int? gasPrice;

  ContractCallReq(
      {this.sourceAddress,
      this.contractAddress,
      this.code,
      this.input,
      this.contractBalance,
      this.optType,
      this.feeLimit,
      this.gasPrice});

  factory ContractCallReq.fromJson(Map<String, dynamic> json) =>
      _$ContractCallReqFromJson(json);

  Map<String, dynamic> toJson() => _$ContractCallReqToJson(this);

  static ContractCallReq fromJsonModel(Map<String, dynamic> json) =>
      ContractCallReq.fromJson(json);
}
