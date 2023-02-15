import 'package:freezed_annotation/freezed_annotation.dart';

part 'contract.g.dart';

@JsonSerializable()
class Contract {
  @JsonKey(name: "payload")
  String? payload;

  Contract({this.payload});

  factory Contract.fromJson(Map<String, dynamic> json) =>
      _$ContractFromJson(json);

  Map<String, dynamic> toJson() => _$ContractToJson(this);

  static Contract fromJsonModel(Map<String, dynamic> json) =>
      Contract.fromJson(json);
}
