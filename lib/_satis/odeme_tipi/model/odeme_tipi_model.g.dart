// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'odeme_tipi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OdemeTipiModel _$OdemeTipiModelFromJson(Map<String, dynamic> json) =>
    OdemeTipiModel(
      json['kullanici'] as int?,
      json['subeKodu'] as int?,
      json['tarih'] == null ? null : DateTime.parse(json['tarih'] as String),
      json['basTarih'] == null
          ? null
          : DateTime.parse(json['basTarih'] as String),
      json['bitTarih'] == null
          ? null
          : DateTime.parse(json['bitTarih'] as String),
      json['barkod'] as String?,
    );

Map<String, dynamic> _$OdemeTipiModelToJson(OdemeTipiModel instance) =>
    <String, dynamic>{
      'kullanici': instance.kullanici,
      'subeKodu': instance.subeKodu,
      'tarih': instance.tarih?.toIso8601String(),
      'basTarih': instance.basTarih?.toIso8601String(),
      'bitTarih': instance.bitTarih?.toIso8601String(),
      'barkod': instance.barkod,
    };
