// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stok_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StokRequestModel _$StokRequestModelFromJson(Map<String, dynamic> json) =>
    StokRequestModel(
      barkod: json['barkod'] as String?,
      urunKodu: json['urunKodu'] as String?,
      urunAdi: json['urunAdi'] as String?,
      subeKodu: json['subeKodu'] as int?,
      kullanici: json['kullanici'] as int?,
      tarih: json['tarih'] == null
          ? null
          : DateTime.parse(json['tarih'] as String),
    );

Map<String, dynamic> _$StokRequestModelToJson(StokRequestModel instance) =>
    <String, dynamic>{
      'barkod': instance.barkod,
      'urunKodu': instance.urunKodu,
      'urunAdi': instance.urunAdi,
      'subeKodu': instance.subeKodu,
      'kullanici': instance.kullanici,
      'tarih': instance.tarih?.toIso8601String(),
    };
