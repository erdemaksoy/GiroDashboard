// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yetki_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

YetkiModel _$YetkiModelFromJson(Map<String, dynamic> json) => YetkiModel(
      json['yetkiId'] as int,
      json['menuId'] as int?,
      json['menuAdi'] as String?,
      json['rolId'] as int?,
      json['kayitYetki'] as bool?,
      json['silYetki'] as bool?,
      json['guncelleYetki'] as bool?,
      json['izlemeYetki'] as bool?,
      json['gorunurMu'] as String,
      json['controller'] as String?,
    );

Map<String, dynamic> _$YetkiModelToJson(YetkiModel instance) =>
    <String, dynamic>{
      'yetkiId': instance.yetkiId,
      'menuId': instance.menuId,
      'menuAdi': instance.menuAdi,
      'rolId': instance.rolId,
      'kayitYetki': instance.kayitYetki,
      'silYetki': instance.silYetki,
      'guncelleYetki': instance.guncelleYetki,
      'izlemeYetki': instance.izlemeYetki,
      'gorunurMu': instance.gorunurMu,
      'controller': instance.controller,
    };
