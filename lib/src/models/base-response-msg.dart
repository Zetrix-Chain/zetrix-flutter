import 'package:freezed_annotation/freezed_annotation.dart';

part 'base-response-msg.g.dart';

@JsonSerializable()
class BaseResponseMsg {
  int? errorCode;
  String? message;

  BaseResponseMsg({this.errorCode, this.message});

  factory BaseResponseMsg.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseMsgFromJson(json);

  Map<String, dynamic> toJson() => _$BaseResponseMsgToJson(this);

  static BaseResponseMsg fromJsonModel(Map<String, dynamic> json) =>
      BaseResponseMsg.fromJson(json);
}
