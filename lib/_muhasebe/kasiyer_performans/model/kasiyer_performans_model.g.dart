// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kasiyer_performans_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KasiyerPerformansModel _$KasiyerPerformansModelFromJson(
        Map<String, dynamic> json) =>
    KasiyerPerformansModel(
      json['subeKodu'] as int?,
      json['subeAdi'] as String?,
      json['kasiyer'] as int?,
      json['adSoyad'] as String?,
      json['stokAd'] as String?,
      (json['satisMiktar'] as num?)?.toDouble(),
      (json['satisTutar'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$KasiyerPerformansModelToJson(
        KasiyerPerformansModel instance) =>
    <String, dynamic>{
      'subeKodu': instance.subeKodu,
      'subeAdi': instance.subeAdi,
      'kasiyer': instance.kasiyer,
      'adSoyad': instance.adSoyad,
      'stokAd': instance.stokAd,
      'satisMiktar': instance.satisMiktar,
      'satisTutar': instance.satisTutar,
    };
