import 'package:freezed_annotation/freezed_annotation.dart';

part 'contract-call-result.g.dart';

@JsonSerializable()
class ContractCallResult extends JsonSerializable {
  @JsonKey(name: "logs")
  Object? logs;

  @JsonKey(name: "query_rets")
  List<Object>? queryRets;

  ContractCallResult({this.logs, this.queryRets});

  factory ContractCallResult.fromJson(Map<String, dynamic> json) =>
      _$ContractCallResultFromJson(json);

  Map<String, dynamic> toJson() => _$ContractCallResultToJson(this);

  static ContractCallResult fromJsonModel(Map<String, dynamic> json) =>
      ContractCallResult.fromJson(json);
}
