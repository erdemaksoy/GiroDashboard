import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import '../../../core/base/base_model.dart';

part 'rapor_kolon_tanim_model.g.dart';

@JsonSerializable()
class RaporKolonModel extends BaseModel {
  final int id;
  final String? raporKodu;
  final String? kolon;
  final String? kolonBaslik;
  final String? kolonTipi;
  final String? altToplamHesaplansinMi;

  RaporKolonModel(this.id, this.kolon, this.kolonBaslik, this.kolonTipi,
      this.altToplamHesaplansinMi, this.raporKodu);

  factory RaporKolonModel.fromJson(Map<String, dynamic> json) =>
      _$RaporKolonModelFromJson(json);

  Map<String, dynamic> toJson() => _$RaporKolonModelToJson(this);

  @override
  String myJson() => jsonEncode(toJson());
}
