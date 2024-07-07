import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import '../../../core/base/base_model.dart';

part 'kasiyer_acik_model.g.dart';

@JsonSerializable()
class KasiyerAcikModel  extends BaseModel{
  final DateTime? tarih;
  final String? kasiyerAdi;
  final String? personelNo;
  final double? acik;
  final double? fazla;

  KasiyerAcikModel(
  this.tarih, 
  this.kasiyerAdi, 
  this.personelNo,
  this.acik, 
  this.fazla);

  Map<String, dynamic> toJson() => _$KasiyerAcikModelToJson(this);
  
  factory KasiyerAcikModel.fromJson(Map<String, dynamic> json) =>
      _$KasiyerAcikModelFromJson(json);
  
  @override
  String myJson() => jsonEncode(toJson());
  
}
