// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rapor_tanim_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RaporTanimModel _$RaporTanimModelFromJson(Map<String, dynamic> json) =>
    RaporTanimModel(
      json['grupKodu'] as String?,
      json['raporKodu'] as String?,
      json['raporAdi'] as String?,
      json['sQLProsedurAdi'] as String?,
      json['filtre'] as String?,
      json['gosterimTipi'] as String?,
    );

Map<String, dynamic> _$RaporTanimModelToJson(RaporTanimModel instance) =>
    <String, dynamic>{
      'grupKodu': instance.grupKodu,
      'raporKodu': instance.raporKodu,
      'raporAdi': instance.raporAdi,
      'sQLProsedurAdi': instance.sQLProsedurAdi,
      'filtre': instance.filtre,
      'gosterimTipi': instance.gosterimTipi,
    };
