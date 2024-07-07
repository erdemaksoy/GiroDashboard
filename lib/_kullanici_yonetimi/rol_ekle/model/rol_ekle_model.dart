import 'dart:convert';

import '../../../core/base/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rol_ekle_model.g.dart';

@JsonSerializable()
class RolEkleModel extends  BaseModel {
  final String? rolAciklama;

  RolEkleModel(this.rolAciklama);

  Map<String, dynamic> toJson() => _$RolEkleModelToJson(this);
  
  @override
  String myJson() => jsonEncode(toJson());
}
