import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import '../core/base/base_model.dart';

part 'stok_request_model.g.dart';

@JsonSerializable()
class StokRequestModel extends BaseModel{
  String? barkod;
  String? urunKodu;
  String? urunAdi;
  int? subeKodu;
  int? kullanici;
  DateTime? tarih;

  StokRequestModel({
    this.barkod,
    this.urunKodu,
    this.urunAdi,
    this.subeKodu,
    this.kullanici,
    this.tarih,
  });

  Map<String, dynamic> toJson() => _$StokRequestModelToJson(this);

  fromJson(Map<String, dynamic> json) =>
      _$StokRequestModelFromJson(json);
  
  @override
  String myJson()  => jsonEncode(toJson());
}