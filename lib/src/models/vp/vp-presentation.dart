import 'package:json_annotation/json_annotation.dart';
import 'package:zetrix_flutter/src/models/vp/credential-parse.dart';
import 'package:zetrix_flutter/src/models/vp/vc-vp-proof.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vp-presentation.g.dart';

@JsonSerializable()
class VerifiablePresentation {
  @JsonKey(name: "@context")
  List<String>? context;

  @JsonKey(name: "type")
  List<String>? type;

  @JsonKey(name: "credentialRequest")
  String? credentialRequest;

  @JsonKey(name: "credentialParse")
  List<CredentialParse>? credentialParse;

  @JsonKey(name: "verifiableCredential")
  List<Map<String, dynamic>>? verifiableCredential;

  @JsonKey(name: "proof")
  VcVpProof? proof;

  VerifiablePresentation(
      {this.context,
      this.type,
      this.credentialRequest,
      this.credentialParse,
      this.verifiableCredential,
      this.proof});

  factory VerifiablePresentation.fromJson(Map<String, dynamic> json) =>
      _$VerifiablePresentationFromJson(json);

  Map<String, dynamic> toJson() => _$VerifiablePresentationToJson(this);

// void addCredential(credential) {}
}
