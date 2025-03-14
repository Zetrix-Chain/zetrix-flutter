import 'package:freezed_annotation/freezed_annotation.dart';

part 'operation.g.dart';

@JsonSerializable(explicitToJson: true, genericArgumentFactories: true)
class Operation<T extends JsonSerializable> {
  @JsonKey(name: "type")
  int? type;

  @JsonKey(name: "create_account")
  T? createAccount;

  @JsonKey(name: "issue_asset")
  T? issueAsset;

  @JsonKey(name: "pay_asset")
  T? payAsset;

  @JsonKey(name: "set_metadata")
  T? setMetadata;

  @JsonKey(name: "set_signer_weight")
  T? setSignerWeight;

  @JsonKey(name: "set_threshold")
  T? setThreshold;

  @JsonKey(name: "pay_coin")
  T? payCoin;

  @JsonKey(name: "log")
  T? log;

  @JsonKey(name: "set_privilege")
  T? setPrivilege;

  Operation(
      {this.type,
      this.createAccount,
      this.issueAsset,
      this.log,
      this.payAsset,
      this.payCoin,
      this.setMetadata,
      this.setPrivilege,
      this.setSignerWeight,
      this.setThreshold});

  // Factory to create a Operation from JSON
  factory Operation.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$OperationFromJson(json, fromJsonT);

  // Method to convert Operation to JSON
  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$OperationToJson(this, toJsonT);
}
