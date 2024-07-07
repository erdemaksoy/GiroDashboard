import 'dart:convert';

import '../core/base/base_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'muhaseberequestmodel.g.dart';
@JsonSerializable()
class MuhasebeRequestModel extends BaseModel{
   final int? kullanici;
  final int? subeKodu;
  final DateTime? tarih;
  final DateTime? basTarih;
  final DateTime? bitTarih;
  final String? barkod;

MuhasebeRequestModel({
    this.kullanici,
    this.subeKodu,
    this.tarih,
    this.basTarih,
    this.bitTarih,
    this.barkod,
  });
  

  fromJson(Map<String, dynamic> json)  =>
      _$MuhasebeRequestModelFromJson(json);
  
  @override
  String myJson() => jsonEncode(toJson());
  
  Map<String, dynamic> toJson() => _$MuhasebeRequestModelToJson(this);
}