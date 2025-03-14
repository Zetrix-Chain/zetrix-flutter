import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zetrix_flutter/src/models/operations/base-operation.dart';
import 'package:zetrix_flutter/src/utils/operation-type.enum.dart';

part 'account-set-metadata-operation.g.dart';

@JsonSerializable()
class AccountSetMetadataOperation extends BaseOperation {
  @JsonKey(name: "key")
  String? key;

  @JsonKey(name: "value")
  String? value;

  @JsonKey(name: "version")
  int? version;

  @JsonKey(name: "delete_flag")
  bool? deleteFlag;

  AccountSetMetadataOperation(
      {this.key, this.value, this.version, this.deleteFlag});

  factory AccountSetMetadataOperation.fromJson(Map<String, dynamic> json) =>
      _$AccountSetMetadataOperationFromJson(json);

  Map<String, dynamic> toJson() => _$AccountSetMetadataOperationToJson(this);

  static AccountSetMetadataOperation fromJsonModel(Map<String, dynamic> json) =>
      AccountSetMetadataOperation.fromJson(json);
}
