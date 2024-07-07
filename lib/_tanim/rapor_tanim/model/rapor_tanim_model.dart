import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

import '../../../core/base/base_model.dart';

part 'rapor_tanim_model.g.dart';

@JsonSerializable()
class RaporTanimModel extends BaseModel {
  final String? grupKodu;
  final String? raporKodu;
  final String? raporAdi;
  final String? sQLProsedurAdi;
  final String? filtre;
  final String? gosterimTipi;

  RaporTanimModel(this.grupKodu, this.raporKodu, this.raporAdi, this.sQLProsedurAdi, this.filtre, this.gosterimTipi);
      
  Map<String, dynamic> toJson() => _$RaporTanimModelToJson(this);
  factory RaporTanimModel.fromJson(Map<String, dynamic> json)=>
      _$RaporTanimModelFromJson(json);
  
  @override
  String myJson() => jsonEncode(toJson());
}