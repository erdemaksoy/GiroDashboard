// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rapor_filtre_tanim_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RaporFiltreTanimModel _$RaporFiltreTanimModelFromJson(
        Map<String, dynamic> json) =>
    RaporFiltreTanimModel(
      json['id'] as int,
      json['filtreBaslik'] as String?,
      json['filtreTipi'] as String?,
      json['filtreDeger'] as String?,
      json['varsayilanDeger'] as String?,
      json['sira'] as int?,
      json['filtreKodu'] as String?,
      json['raporKodu'] as String?,
    );

Map<String, dynamic> _$RaporFiltreTanimModelToJson(
        RaporFiltreTanimModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'filtreBaslik': instance.filtreBaslik,
      'filtreTipi': instance.filtreTipi,
      'filtreDeger': instance.filtreDeger,
      'varsayilanDeger': instance.varsayilanDeger,
      'sira': instance.sira,
      'filtreKodu': instance.filtreKodu,
      'raporKodu': instance.raporKodu,
    };
