import 'package:freezed_annotation/freezed_annotation.dart';

part 'account-resp.g.dart';

@JsonSerializable(explicitToJson: true, genericArgumentFactories: true)
class AccountResp<T> {
  @JsonKey(name: "result")
  T? result;

  AccountResp({this.result});

  factory AccountResp.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$AccountRespFromJson(json, fromJsonT);

  // @override
  Map<String, dynamic> toJson(T Function(Object? json) fromJsonT) =>
      _$AccountRespToJson(this, fromJsonT);
}
