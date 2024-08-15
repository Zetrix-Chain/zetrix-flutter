import 'package:freezed_annotation/freezed_annotation.dart';

part 'credential-parse.g.dart';

@JsonSerializable()
class CredentialParse {
  @JsonKey(name: "parseType")
  String? parseType;

  @JsonKey(name: "format")
  String? format;

  CredentialParse({this.parseType, this.format});

  factory CredentialParse.fromJson(Map<String, dynamic> json) =>
      _$CredentialParseFromJson(json);

  Map<String, dynamic> toJson() => _$CredentialParseToJson(this);
}
