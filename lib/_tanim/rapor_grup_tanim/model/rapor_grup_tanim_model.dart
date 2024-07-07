import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import '../../../core/base/base_model.dart';

part 'rapor_grup_tanim_model.g.dart';

@JsonSerializable()
class RaporGrupTanimModel extends BaseModel {
  String? grupKodu;
  String? grupAciklama;
  int? id;

  RaporGrupTanimModel(this.grupKodu, this.grupAciklama, this.id);

  Map<String, dynamic> toJson() => _$RaporGrupTanimModelToJson(this);
  factory RaporGrupTanimModel.formJson(Map<String, dynamic> json) =>
      _$RaporGrupTanimModelFromJson(json);

  @override
  String myJson() => jsonEncode(toJson());
}
