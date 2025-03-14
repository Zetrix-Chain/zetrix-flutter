import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zetrix_flutter/src/models/operations/base-operation.dart';
import 'package:zetrix_flutter/src/utils/operation-type.enum.dart';

part 'log-create-operation.g.dart';

@JsonSerializable()
class LogCreateOperation extends BaseOperation {
  @JsonKey(name: "topic")
  String? topic;

  @JsonKey(name: "datas")
  List<String>? datas;

  LogCreateOperation({this.topic, this.datas});

  factory LogCreateOperation.fromJson(Map<String, dynamic> json) =>
      _$LogCreateOperationFromJson(json);

  Map<String, dynamic> toJson() => _$LogCreateOperationToJson(this);

  static LogCreateOperation fromJsonModel(Map<String, dynamic> json) =>
      LogCreateOperation.fromJson(json);
}
