import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import '../../../core/base/base_model.dart';

part 'yetki_model.g.dart';

@JsonSerializable()
class YetkiModel extends BaseModel {
  late int yetkiId;
  late int? menuId;
  late String? menuAdi;
  late int? rolId;
  late bool? kayitYetki;
  late bool? silYetki;
  late bool? guncelleYetki;
  late bool? izlemeYetki;
  late String gorunurMu;
  late String? controller;

  YetkiModel(
      this.yetkiId,
      this.menuId,
      this.menuAdi,
      this.rolId,
      this.kayitYetki,
      this.silYetki,
      this.guncelleYetki,
      this.izlemeYetki,
      this.gorunurMu,
      this.controller);

  Map<String, dynamic> toJson() => _$YetkiModelToJson(this);

  factory YetkiModel.fromJson(Map<String, dynamic> json) =>
      _$YetkiModelFromJson(json);

  @override
  String myJson() => jsonEncode(toJson());
}
