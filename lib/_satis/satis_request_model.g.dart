// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'satis_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SatisRequestModel _$SatisRequestModelFromJson(Map<String, dynamic> json) =>
    SatisRequestModel(
      barkod: json['barkod'] as String?,
      subeKodu: json['subeKodu'] as int?,
      kullanici: json['kullanici'] as int?,
      tarih: json['tarih'] == null
          ? null
          : DateTime.parse(json['tarih'] as String),
      basTarih: json['basTarih'] == null
          ? null
          : DateTime.parse(json['basTarih'] as String),
      bitTarih: json['bitTarih'] == null
          ? null
          : DateTime.parse(json['bitTarih'] as String),
    );

Map<String, dynamic> _$SatisRequestModelToJson(SatisRequestModel instance) =>
    <String, dynamic>{
      'barkod': instance.barkod,
      'subeKodu': instance.subeKodu,
      'kullanici': instance.kullanici,
      'tarih': instance.tarih?.toIso8601String(),
      'basTarih': instance.basTarih?.toIso8601String(),
      'bitTarih': instance.bitTarih?.toIso8601String(),
    };
