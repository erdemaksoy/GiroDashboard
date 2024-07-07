import 'dart:convert';

import '../../../core/base/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'odeme_tipi_model.g.dart';

@JsonSerializable()
class OdemeTipiModel extends BaseModel{
  final int? kullanici;
  final int? subeKodu;
  final DateTime? tarih;
  final DateTime? basTarih;
  final DateTime? bitTarih;
  final String? barkod;

  OdemeTipiModel(this.kullanici, this.subeKodu, this.tarih, this.basTarih, this.bitTarih, this.barkod);

  factory OdemeTipiModel.fromJson(Map<String, dynamic> json) =>
      _$OdemeTipiModelFromJson(json);

  Map<String, dynamic> toJson() => _$OdemeTipiModelToJson(this);
  
  @override
  fromJson(Map<String, dynamic> json) =>
      _$OdemeTipiModelFromJson(json);
  
  @override
  String myJson() =>
  jsonEncode(toJson());
      
}
