// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'en_cok_satan_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnCokSatanModel _$EnCokSatanModelFromJson(Map<String, dynamic> json) =>
    EnCokSatanModel(
      json['stokKodu'] as String?,
      json['stokAdi'] as String?,
      (json['satisMiktari'] as num?)?.toDouble(),
      (json['satisTutari'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$EnCokSatanModelToJson(EnCokSatanModel instance) =>
    <String, dynamic>{
      'stokKodu': instance.stokKodu,
      'stokAdi': instance.stokAdi,
      'satisMiktari': instance.satisMiktari,
      'satisTutari': instance.satisTutari,
    };
