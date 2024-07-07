// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kullanici_listesi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KullaniciListesiModel _$KullaniciListesiModelFromJson(
        Map<String, dynamic> json) =>
    KullaniciListesiModel(
      json['kullaniciNo'] as int,
      json['kullaniciAdi'] as String?,
      json['kullaniciIsim'] as String?,
      json['rolId'] as int?,
    );

Map<String, dynamic> _$KullaniciListesiModelToJson(
        KullaniciListesiModel instance) =>
    <String, dynamic>{
      'kullaniciNo': instance.kullaniciNo,
      'kullaniciAdi': instance.kullaniciAdi,
      'kullaniciIsim': instance.kullaniciIsim,
      'rolId': instance.rolId,
    };
