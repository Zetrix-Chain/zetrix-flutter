import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zetrix_flutter/src/models/operations/base-operation.dart';
import 'package:zetrix_flutter/src/utils/operation-type.enum.dart';

part 'contract-create-operation.g.dart';

@JsonSerializable()
class ContractCreateOperation extends BaseOperation {
  @JsonKey(name: "init_balance")
  String? initBalance;

  @JsonKey(name: "payload")
  String? payload;

  @JsonKey(name: "owner")
  String? owner;

  @JsonKey(name: "initInput")
  String? initInput;

  ContractCreateOperation(
      {this.initBalance, this.owner, this.payload, this.initInput});

  factory ContractCreateOperation.fromJson(Map<String, dynamic> json) =>
      _$ContractCreateOperationFromJson(json);

  Map<String, dynamic> toJson() => _$ContractCreateOperationToJson(this);

  static ContractCreateOperation fromJsonModel(Map<String, dynamic> json) =>
      ContractCreateOperation.fromJson(json);
}
