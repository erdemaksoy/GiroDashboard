import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import '../../../core/base/base_model.dart';

part 'rapor_filtre_tanim_model.g.dart';

@JsonSerializable()
class RaporFiltreTanimModel extends BaseModel {
  final int id;
  final String? filtreBaslik;
  final String? filtreTipi;
  final String? filtreDeger;
  final String? varsayilanDeger;
  final int? sira;
  final String? filtreKodu;
  final String? raporKodu;
  RaporFiltreTanimModel(
      this.id,
      this.filtreBaslik,
      this.filtreTipi,
      this.filtreDeger,
      this.varsayilanDeger,
      this.sira,
      this.filtreKodu,
      this.raporKodu);

  Map<String, dynamic> toJson() => _$RaporFiltreTanimModelToJson(this);
  factory RaporFiltreTanimModel.fromJson(Map<String, dynamic> json) =>
      _$RaporFiltreTanimModelFromJson(json);

  @override
  String myJson() => jsonEncode(toJson());
}
