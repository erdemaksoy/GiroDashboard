// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'muhasebe_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MuhasebeRequestModel _$MuhasebeRequestModelFromJson(Map<String, dynamic> json) {
  return MuhasebeRequestModel(
    kullanici: json['kullanici'] as int?,
    subeKodu: json['subeKodu'] as int?,
    tarih: json['tarih'] != null ? DateTime.parse(json['tarih'] as String) : null,
    basTarih: json['basTarih'] != null ? DateTime.parse(json['basTarih'] as String) : null,
    bitTarih: json['bitTarih'] != null ? DateTime.parse(json['bitTarih'] as String) : null,
    barkod: json['barkod'] as String?,
  );
}

Map<String, dynamic> _$MuhasebeRequestModelToJson(MuhasebeRequestModel instance) => <String, dynamic>{
  'kullanici': instance.kullanici,
  'subeKodu': instance.subeKodu,
  'tarih': instance.tarih?.toIso8601String(), // Convert DateTime to String
  'basTarih': instance.basTarih?.toIso8601String(), // Convert DateTime to String
  'bitTarih': instance.bitTarih?.toIso8601String(), // Convert DateTime to String
  'barkod': instance.barkod,
};

