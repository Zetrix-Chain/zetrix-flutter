import 'package:freezed_annotation/freezed_annotation.dart';
import 'base-response.dart';
import 'account-info-result.dart';
part 'account-info-resp.g.dart';


@JsonSerializable(explicitToJson: true)
class AccountInfoResp extends BaseResponse {
  @JsonKey(name: "result")
  AccountInfo? result;

  AccountInfoResp({this.result});

  factory AccountInfoResp.fromJson(Map<String, dynamic> json) =>
      _$AccountInfoRespFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AccountInfoRespToJson(this);

  
  static AccountInfoResp fromJsonModel(Map<String, dynamic> json) =>
      AccountInfoResp.fromJson(json);

  
}
