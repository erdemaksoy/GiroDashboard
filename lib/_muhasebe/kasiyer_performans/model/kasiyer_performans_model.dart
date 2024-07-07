import 'dart:convert';

import '../../../core/base/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'kasiyer_performans_model.g.dart';

@JsonSerializable()
class KasiyerPerformansModel extends BaseModel{
  final int? subeKodu;
  final String? subeAdi;
  final int? kasiyer;
  final String? adSoyad;
  final String? stokAd;
  final double? satisMiktar;
  final double? satisTutar;

  KasiyerPerformansModel(this.subeKodu, this.subeAdi, this.kasiyer,
      this.adSoyad, this.stokAd, this.satisMiktar, this.satisTutar);

  factory KasiyerPerformansModel.fromJson(Map<String, dynamic> json) =>
      _$KasiyerPerformansModelFromJson(json);

  Map<String, dynamic> toJson() => _$KasiyerPerformansModelToJson(this);
  
  @override
  String myJson() =>jsonEncode(toJson());
}
