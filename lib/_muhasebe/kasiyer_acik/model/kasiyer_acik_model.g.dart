// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kasiyer_acik_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KasiyerAcikModel _$KasiyerAcikModelFromJson(Map<String, dynamic> json) =>
    KasiyerAcikModel(
      json['tarih'] == null ? null : DateTime.parse(json['tarih'] as String),
      json['kasiyerAdi'] as String?,
      json['personelNo'] as String?,
      (json['acik'] as num?)?.toDouble(),
      (json['fazla'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$KasiyerAcikModelToJson(KasiyerAcikModel instance) =>
    <String, dynamic>{
      'tarih': instance.tarih?.toIso8601String(),
      'kasiyerAdi': instance.kasiyerAdi,
      'personelNo': instance.personelNo,
      'acik': instance.acik,
      'fazla': instance.fazla,
    };
