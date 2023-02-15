import 'package:freezed_annotation/freezed_annotation.dart';

import '../utils/operation-type.enum.dart';

part 'base-response.g.dart';

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: "error_code")
  int? errorCode;
  @JsonKey(name: "error_desc")
  String? errorDesc;

  BaseResponse({this.errorCode, this.errorDesc});

  factory BaseResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);

  static BaseResponse fromJsonModel(Map<String, dynamic> json) =>
      BaseResponse.fromJson(json);
}
