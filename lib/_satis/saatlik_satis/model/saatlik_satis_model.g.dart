// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saatlik_satis_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaatlikSatisModel _$SaatlikSatisModelFromJson(Map<String, dynamic> json) =>
    SaatlikSatisModel(
      json['tarih'] == null ? null : DateTime.parse(json['tarih'] as String),
      json['saat'] as String?,
      json['musSay'] as int?,
      (json['sepetOrt'] as num?)?.toDouble(),
      (json['ciro'] as num?)?.toDouble(),
      (json['yemekKarti'] as num?)?.toDouble(),
      (json['toplamSepet'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$SaatlikSatisModelToJson(SaatlikSatisModel instance) =>
    <String, dynamic>{
      'tarih': instance.tarih?.toIso8601String(),
      'saat': instance.saat,
      'musSay': instance.musSay,
      'sepetOrt': instance.sepetOrt,
      'ciro': instance.ciro,
      'yemekKarti': instance.yemekKarti,
      'toplamSepet': instance.toplamSepet,
    };
