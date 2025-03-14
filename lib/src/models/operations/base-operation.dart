import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zetrix_flutter/src/utils/operation-type.enum.dart';

part 'base-operation.g.dart';

@JsonSerializable(explicitToJson: true)
class BaseOperation extends JsonSerializable {
  OperationType? operationType;
  String? sourceAddress;
  String? metadata;

  BaseOperation({this.operationType, this.sourceAddress, this.metadata});

  factory BaseOperation.fromJson(Map<String, dynamic> json) =>
      _$BaseOperationFromJson(json);

  Map<String, dynamic> toJson() => _$BaseOperationToJson(this);

  static BaseOperation fromJsonModel(Map<String, dynamic> json) =>
      BaseOperation.fromJson(json);
}
