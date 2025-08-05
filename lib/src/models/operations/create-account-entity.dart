import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zetrix_flutter/src/models/operations/metadata.dart';
import 'package:zetrix_flutter/src/models/operations/priv.dart';

import 'contract.dart';

part 'create-account-entity.g.dart';

@JsonSerializable()
class CreateAccountEntity {
  @JsonKey(name: "dest_address")
  String? destAddress;

  @JsonKey(name: "priv")
  Priv? priv;

  @JsonKey(name: "metadatas")
  List<Metadata>? metadatas;

  @JsonKey(name: "contract")
  Contract? contract;

  CreateAccountEntity(
      {this.destAddress, this.priv, this.metadatas, this.contract});

  factory CreateAccountEntity.fromJson(Map<String, dynamic> json) =>
      _$CreateAccountEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CreateAccountEntityToJson(this);

  static CreateAccountEntity fromJsonModel(Map<String, dynamic> json) =>
      CreateAccountEntity.fromJson(json);
}
