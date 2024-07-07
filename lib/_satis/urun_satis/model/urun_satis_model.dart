import 'dart:convert';

import '../../../core/base/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'urun_satis_model.g.dart';

@JsonSerializable()
class UrunSatisModel extends BaseModel {
 final DateTime? tarih;
final double? sube;
final double? kasaNo;
final double? fisNo;
final double? saat;
final double? sira;
final String? musteriNo;
final double? zNo;
final String? stokAd;
final String? stokKod;
final String? barkod;
final String? belge;
final String? durumu;
final double? kasiyer;
final double? kdv;
final double? fiyat;
final double? miktar;
final String? birim;
final double? tutar;
final double? satirInd;
final double? genelInd;
final double? fisToplam;


  UrunSatisModel(this.tarih, this.sube, this.kasaNo, this.fisNo, this.saat, this.sira, this.musteriNo, this.zNo, this.stokAd, this.stokKod, this.barkod, this.belge, this.durumu, this.kasiyer, this.kdv, this.fiyat, this.miktar, this.birim, this.tutar, this.satirInd, this.genelInd, this.fisToplam);

  factory UrunSatisModel.fromJson(Map<String, dynamic> json) =>
      _$UrunSatisModelFromJson(json);

  Map<String, dynamic> toJson() => _$UrunSatisModelToJson(this);

  fromJson(Map<String, dynamic> json) =>
      _$UrunSatisModelFromJson(json); 
  
  @override
  String myJson() => jsonEncode(myJson());
     
}
