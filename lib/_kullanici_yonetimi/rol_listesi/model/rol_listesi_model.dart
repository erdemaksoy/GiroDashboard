import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import '../../../core/base/base_model.dart';

part 'rol_listesi_model.g.dart';

@JsonSerializable()
class RolListeModel extends BaseModel {
  int rolId;
  DateTime? rIdate;
  int? rIkull;
  DateTime? rUdate;
  int? rUkull;
  String? rolAciklama;

  RolListeModel(this.rolId, this.rIdate, this.rIkull, this.rUdate, this.rUkull,
      this.rolAciklama);

  Map<String, dynamic> toJson() => _$RolListeModelToJson(this);

  factory RolListeModel.fromJson(Map<String, dynamic> json) =>
      _$RolListeModelFromJson(json);

  @override
  String myJson() => jsonEncode(toJson());
}
