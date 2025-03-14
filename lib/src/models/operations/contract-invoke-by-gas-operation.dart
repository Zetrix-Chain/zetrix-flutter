import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zetrix_flutter/src/models/operations/base-operation.dart';
import 'package:zetrix_flutter/src/utils/operation-type.enum.dart';

part 'contract-invoke-by-gas-operation.g.dart';

@JsonSerializable()
class ContractInvokeByGasOperation extends BaseOperation {
  @JsonKey(name: "dest_address")
  String? contractAddress;

  @JsonKey(name: "amount")
  int? ztxAmount;

  @JsonKey(name: "input")
  String? input;

  ContractInvokeByGasOperation(
      {this.contractAddress, this.ztxAmount, this.input});

  factory ContractInvokeByGasOperation.fromJson(Map<String, dynamic> json) =>
      _$ContractInvokeByGasOperationFromJson(json);

  Map<String, dynamic> toJson() => _$ContractInvokeByGasOperationToJson(this);

  static ContractInvokeByGasOperation fromJsonModel(
          Map<String, dynamic> json) =>
      ContractInvokeByGasOperation.fromJson(json);
}
