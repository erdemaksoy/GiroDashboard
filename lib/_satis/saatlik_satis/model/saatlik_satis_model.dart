import 'dart:convert';

import '../../../core/base/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'saatlik_satis_model.g.dart';

@JsonSerializable()
class SaatlikSatisModel extends BaseModel {
  final DateTime? tarih;
  final String? saat;
  final int? musSay;
  final double? sepetOrt;
  final double? ciro;
  final double? yemekKarti;
  final double? toplamSepet;

  SaatlikSatisModel(this.tarih, this.saat, this.musSay, this.sepetOrt, this.ciro, this.yemekKarti, this.toplamSepet);

  Map<String, dynamic> toJson() => _$SaatlikSatisModelToJson(this);
  factory SaatlikSatisModel.fromJson(Map<String, dynamic> json)=>
      _$SaatlikSatisModelFromJson(json);  
  @override
  String myJson() => jsonEncode(toJson());
}
