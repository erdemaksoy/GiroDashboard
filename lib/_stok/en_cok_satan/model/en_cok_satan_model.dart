import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import '../../../core/base/base_model.dart';

part 'en_cok_satan_model.g.dart';

@JsonSerializable()
class EnCokSatanModel extends BaseModel {
  final String? stokKodu;
  final String? stokAdi;
  final double? satisMiktari;
  final double? satisTutari;

  EnCokSatanModel(
      this.stokKodu, this.stokAdi, this.satisMiktari, this.satisTutari);

  Map<String, dynamic> toJson() => _$EnCokSatanModelToJson(this);

  factory EnCokSatanModel.fromJson(Map<String, dynamic> json) =>
      _$EnCokSatanModelFromJson(json);

  @override
  String myJson() => jsonEncode(toJson());
  List<dynamic> get properties =>
      [satisMiktari, satisTutari, stokKodu, stokAdi];
}
