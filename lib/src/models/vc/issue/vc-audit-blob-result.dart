import 'package:freezed_annotation/freezed_annotation.dart';

part 'vc-audit-blob-result.g.dart';

@JsonSerializable()
class VcAuditBlobResult {

  @JsonKey(name: "payload")
  String? payload;

  @JsonKey(name: "payloadId")
  String? payloadId;

  @JsonKey(name: "bcTxBlob")
  String? bcTxBlob;


  VcAuditBlobResult({
      this.payload,
      this.payloadId,
      this.bcTxBlob
      });

  factory VcAuditBlobResult.fromJson(Map<String, dynamic> json) =>
      _$VcAuditBlobResultFromJson(json);

  Map<String, dynamic> toJson() => _$VcAuditBlobResultToJson(this);

  static VcAuditBlobResult fromJsonModel(Map<String, dynamic> json) =>
      VcAuditBlobResult.fromJson(json);
}
