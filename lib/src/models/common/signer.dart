import 'package:freezed_annotation/freezed_annotation.dart';

part 'signer.g.dart';

@JsonSerializable()
class Signer {
  @JsonKey(name: "address")
  String? address;

  @JsonKey(name: "weight")
  int? weight;

  Signer({this.address, this.weight});

  factory Signer.fromJson(Map<String, dynamic> json) => _$SignerFromJson(json);

  Map<String, dynamic> toJson() => _$SignerToJson(this);

  static Signer fromJsonModel(Map<String, dynamic> json) =>
      Signer.fromJson(json);
}
