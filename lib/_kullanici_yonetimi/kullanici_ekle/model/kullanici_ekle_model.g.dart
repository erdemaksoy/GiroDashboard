// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kullanici_ekle_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KullaniciEkleModel _$KullaniciEkleModelFromJson(Map<String, dynamic> json) =>
    KullaniciEkleModel(
      json['kullId'] as int,
      json['kullKodu'] as String?,
      json['kullParola'] as String?,
      json['kullAdi'] as String?,
      json['kullRolid'] as int?,
      json['kullEposta'] as String?,
      json['kullTelefon'] as String?,
      json['acikSubeler'] as String?,
      json['sifreDegistiMi'] as String?,
      json['dashboardYetki'] as String?,
      json['varsayilanRaporId'] as String?,
      json['kullResim'] as String?,
    );

Map<String, dynamic> _$KullaniciEkleModelToJson(KullaniciEkleModel instance) =>
    <String, dynamic>{
      'kullId': instance.kullId,
      'kullKodu': instance.kullKodu,
      'kullParola': instance.kullParola,
      'kullAdi': instance.kullAdi,
      'kullRolid': instance.kullRolid,
      'kullEposta': instance.kullEposta,
      'kullTelefon': instance.kullTelefon,
      'acikSubeler': instance.acikSubeler,
      'sifreDegistiMi': instance.sifreDegistiMi,
      'dashboardYetki': instance.dashboardYetki,
      'varsayilanRaporId': instance.varsayilanRaporId,
      'kullResim': instance.kullResim,
    };
