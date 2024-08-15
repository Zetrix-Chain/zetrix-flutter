import 'package:freezed_annotation/freezed_annotation.dart';

part 'vc-general-resp.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class VcGeneralResp<T> {
  T? data;
  int? errorCode;
  String? message;

  VcGeneralResp({this.data, this.errorCode, this.message});

  factory VcGeneralResp.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$VcGeneralRespFromJson<T>(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$VcGeneralRespToJson<T>(this, toJsonT);
}
