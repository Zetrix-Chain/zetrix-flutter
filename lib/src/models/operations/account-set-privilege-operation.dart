import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zetrix_flutter/src/models/operations/base-operation.dart';
import 'package:zetrix_flutter/src/models/common/signer.dart';
import 'package:zetrix_flutter/src/models/common/type-threshold.dart';
import 'package:zetrix_flutter/src/utils/operation-type.enum.dart';

part 'account-set-privilege-operation.g.dart';

@JsonSerializable()
class AccountSetPrivilegeOperation extends BaseOperation {
  @JsonKey(name: "key")
  int? masterWeight;

  @JsonKey(name: "signers")
  List<Signer>? signers;

  @JsonKey(name: "tx_threshold")
  int? txThreshold;

  @JsonKey(name: "type_thresholds")
  List<TypeThreshold>? typeThresholds;

  AccountSetPrivilegeOperation(
      {this.masterWeight, this.signers, this.txThreshold, this.typeThresholds});

  factory AccountSetPrivilegeOperation.fromJson(Map<String, dynamic> json) =>
      _$AccountSetPrivilegeOperationFromJson(json);

  Map<String, dynamic> toJson() => _$AccountSetPrivilegeOperationToJson(this);

  static AccountSetPrivilegeOperation fromJsonModel(
          Map<String, dynamic> json) =>
      AccountSetPrivilegeOperation.fromJson(json);
}
