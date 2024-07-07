// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_add_model.dart';

// **************************
// JsonSerializableGenerator
// **************************

DashboardAddModel _$DashboardAddModelFromJson(Map<String, dynamic> json) {
  return DashboardAddModel(
    id: json['id'] as int,
    raporAdi: json['raporAdi'] as String?,
    raporBaslik: json['raporBaslik'] as String?,
    raporProc: json['raporProc'] as String?,
    raporTipi: json['raporTipi'] as int?,
    aciklama: json['aciklama'] as String?,
    raporSiraNo: json['raporSiraNo'] as int?,
    aktifPasif: json['aktifPasif'] as bool,
    siraNo: json['siraNo'] as int?,
    genislik: json['genislik'] as String?,
    ikon: json['ikon'] as String?,
    procedureSira: json['procedureSira'] as int?,
  );
}

Map<String, dynamic> _$DashboardAddModelToJson(DashboardAddModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'raporAdi': instance.raporAdi,
      'raporBaslik': instance.raporBaslik,
      'raporProc': instance.raporProc,
      'raporTipi': instance.raporTipi,
      'aciklama': instance.aciklama,
      'raporSiraNo': instance.raporSiraNo,
      'aktifPasif': instance.aktifPasif,
      'siraNo': instance.siraNo,
      'genislik': instance.genislik,
      'ikon': instance.ikon,
      'procedureSira': instance.procedureSira
    };
