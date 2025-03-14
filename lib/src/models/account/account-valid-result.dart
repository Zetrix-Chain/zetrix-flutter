import 'package:json_annotation/json_annotation.dart';

part 'account-valid-result.g.dart';

@JsonSerializable(explicitToJson: true)
class AccountValidResult {

  bool? isValid;

  AccountValidResult({this.isValid});

  factory AccountValidResult.fromJson(Map<String, dynamic> json) => _$AccountValidResultFromJson(json);

  Map<String,dynamic> toJson() => _$AccountValidResultToJson(this);

}