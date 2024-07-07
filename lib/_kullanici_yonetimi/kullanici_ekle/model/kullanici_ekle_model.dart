import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import '../../../core/base/base_model.dart';

part 'kullanici_ekle_model.g.dart';

@JsonSerializable()
class KullaniciEkleModel extends BaseModel {
  int kullId;
  String? kullKodu;
  String? kullParola;
  String? kullAdi;
  int? kullRolid;
  String? kullEposta;
  String? kullTelefon;
  String? acikSubeler;
  String? sifreDegistiMi;
  String? dashboardYetki;
  String? varsayilanRaporId;
  String? kullResim;

  KullaniciEkleModel(
      this.kullId,
      this.kullKodu,
      this.kullParola,
      this.kullAdi,
      this.kullRolid,
      this.kullEposta,
      this.kullTelefon,
      this.acikSubeler,
      this.sifreDegistiMi,
      this.dashboardYetki,
      this.varsayilanRaporId,
      this.kullResim);

  Map<String, dynamic> toJson() => _$KullaniciEkleModelToJson(this);

  factory KullaniciEkleModel.fromJson(Map<String, dynamic> json) =>
      _$KullaniciEkleModelFromJson(json);

  @override
  String myJson() => jsonEncode(toJson());
}
