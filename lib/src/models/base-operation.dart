import 'package:freezed_annotation/freezed_annotation.dart';

import '../utils/operation-type.enum.dart';

part 'base-operation.g.dart';

@JsonSerializable()
class BaseOperation {
  OperationType? operationType;
  String? sourceAddress;
  String? operations;

  BaseOperation({this.operationType, this.sourceAddress, this.operations});

  factory BaseOperation.fromJson(Map<String, dynamic> json) =>
      _$BaseOperationFromJson(json);

  Map<String, dynamic> toJson() => _$BaseOperationToJson(this);

  static BaseOperation fromJsonModel(Map<String, dynamic> json) =>
      BaseOperation.fromJson(json);
}
