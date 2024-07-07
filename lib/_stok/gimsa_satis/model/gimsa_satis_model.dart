import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import '../../../core/base/base_model.dart';

part 'gimsa_satis_model.g.dart';

@JsonSerializable()
class GimsaSatisModel extends BaseModel {
  final String? stokNo;
  final String? urunKodu;
  final double? barkod;
  final String? urunAdi;
  final double? kdvHaricMal;
  final double? satisFiyati;
  final String? kdv;
  final String? mevcut;
  final String? brm;
  final String? y2023;
  final String? y2022;
  final String? y2021;
  final String? y2020;
  final String? giris2023;

  GimsaSatisModel(
      this.stokNo,
      this.urunKodu,
      this.barkod,
      this.urunAdi,
      this.kdvHaricMal,
      this.satisFiyati,
      this.kdv,
      this.mevcut,
      this.brm,
      this.y2023,
      this.y2022,
      this.y2021,
      this.y2020,
      this.giris2023);

  Map<String, dynamic> toJson() => _$GimsaSatisModelToJson(this);
  factory GimsaSatisModel.fromJson(Map<String, dynamic> json) =>
      _$GimsaSatisModelFromJson(json);

  @override
  String myJson() => jsonEncode(toJson());
}
