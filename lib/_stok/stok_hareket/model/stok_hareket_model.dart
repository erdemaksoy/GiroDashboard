import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

import '../../../core/base/base_model.dart';

part 'stok_hareket_model.g.dart';

@JsonSerializable()
class StokHareketModel extends BaseModel {
  final int? subeKodu;
final DateTime? tarih;
final String? belgeNo;
final String? evrakNo;
final int? belgeTipi;
final String? belgeAdi;
final double? girenMiktar;
final double? cikanMiktar;
final double? harBakiye;
final String? cariAdi;
final double? stokNF;
final double? netTutar;
final double? stokBF;
final double? kdvOrani;
final int? stokHr_Recno;


  StokHareketModel(this.subeKodu, this.tarih, this.belgeNo, this.evrakNo, this.belgeTipi, this.belgeAdi, this.girenMiktar, this.cikanMiktar, this.harBakiye, this.cariAdi, this.stokNF, this.netTutar, this.stokBF, this.kdvOrani, this.stokHr_Recno);

  Map<String, dynamic> toJson() => _$StokHareketModelToJson(this);

 factory StokHareketModel.fromJson(Map<String, dynamic> json)=>
      _$StokHareketModelFromJson(json);
  
  @override
  String myJson() => jsonEncode(toJson());
}