import 'package:freezed_annotation/freezed_annotation.dart';

part 'base-response.g.dart';

@JsonSerializable(explicitToJson: true, genericArgumentFactories: true)
class BaseResponse<T extends JsonSerializable> {
  @JsonKey(name: "result")
  T? result;
  @JsonKey(name: "error_code")
  int? errorCode;
  @JsonKey(name: "error_desc")
  String? errorDesc;

  BaseResponse({this.result, this.errorCode, this.errorDesc});

  factory BaseResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$BaseResponseFromJson<T>(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$BaseResponseToJson<T>(this, toJsonT);
}
