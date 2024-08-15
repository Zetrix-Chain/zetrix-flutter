import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zetrix_flutter/src/models/operations/priv.dart';

part 'account-info-result.g.dart';

@JsonSerializable(explicitToJson: true)
class AccountInfo {
  String? address;

  String? assets;

  @JsonKey(name: 'assets_hash')
  String? assetsHash;

  int? balance;

  String? metadatas;

  @JsonKey(name: 'metadatas_hash')
  String? metadatasHash;

  int? nonce;

  Priv? priv;

  AccountInfo(
      {this.address,
      this.assets,
      this.assetsHash,
      this.balance,
      this.metadatas,
      this.metadatasHash,
      this.nonce,
      this.priv});

  factory AccountInfo.fromJson(Map<String, dynamic> json) =>
      _$AccountInfoFromJson(json);

  Map<String, dynamic> toJson() => _$AccountInfoToJson(this);

  static AccountInfo fromJsonModel(Map<String, dynamic> json) =>
      AccountInfo.fromJson(json);
}
