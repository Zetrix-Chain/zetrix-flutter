import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zetrix_flutter/src/models/operations/base-operation.dart';
import 'package:zetrix_flutter/src/utils/operation-type.enum.dart';

part 'asset-issue-operation.g.dart';

@JsonSerializable()
class AssetIssueOperation extends BaseOperation {
  @JsonKey(name: "code")
  String? code;

  @JsonKey(name: "amount")
  int? amount;

  AssetIssueOperation({this.code, this.amount});

  factory AssetIssueOperation.fromJson(Map<String, dynamic> json) =>
      _$AssetIssueOperationFromJson(json);

  Map<String, dynamic> toJson() => _$AssetIssueOperationToJson(this);

  static AssetIssueOperation fromJsonModel(
          Map<String, dynamic> json) =>
      AssetIssueOperation.fromJson(json);
}
