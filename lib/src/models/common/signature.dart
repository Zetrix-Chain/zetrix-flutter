import 'package:freezed_annotation/freezed_annotation.dart';

part 'signature.g.dart';

@JsonSerializable()
class Signature {
  @JsonKey(name: "sign_data")
  String? signData;

  @JsonKey(name: "public_key")
  String? publicKey;

  Signature({this.signData, this.publicKey});

  factory Signature.fromJson(Map<String, dynamic> json) =>
      _$SignatureFromJson(json);

  Map<String, dynamic> toJson() => _$SignatureToJson(this);

  static Signature fromJsonModel(Map<String, dynamic> json) =>
      Signature.fromJson(json);
}
