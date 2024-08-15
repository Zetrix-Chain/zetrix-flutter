import 'package:freezed_annotation/freezed_annotation.dart';

import 'base-response.dart';
import 'create-account-result.dart';

part 'create-account-resp.g.dart';


@JsonSerializable(explicitToJson: true)
class CreateAccountResp extends BaseResponse {
  @JsonKey(name: "result")
  CreateAccountResult? result;

  CreateAccountResp({this.result});

  factory CreateAccountResp.fromJson(Map<String, dynamic> json) =>
      _$CreateAccountRespFromJson(json);

  Map<String, dynamic> toJson() => _$CreateAccountRespToJson(this);

  static CreateAccountResp fromJsonModel(Map<String, dynamic> json) =>
      CreateAccountResp.fromJson(json);

  
}
