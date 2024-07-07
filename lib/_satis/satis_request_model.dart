import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import '../core/base/base_model.dart';

part 'satis_request_model.g.dart';

@JsonSerializable()
class SatisRequestModel extends BaseModel {
  String? barkod;
  int? subeKodu;
  int? kullanici;
  DateTime? tarih;
  DateTime? basTarih;
  DateTime? bitTarih;

  SatisRequestModel({
    this.barkod,
    this.subeKodu,
    this.kullanici,
    this.tarih,
    this.basTarih,
    this.bitTarih,
  });

  Map<String, dynamic> toJson() => _$SatisRequestModelToJson(this);
  factory SatisRequestModel.fromJson(Map<String, dynamic> json) => 
   _$SatisRequestModelFromJson(json);
  @override
  String myJson()  => jsonEncode(toJson());
}