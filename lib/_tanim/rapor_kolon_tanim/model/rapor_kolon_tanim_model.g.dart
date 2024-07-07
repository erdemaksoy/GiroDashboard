// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rapor_kolon_tanim_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RaporKolonModel _$RaporKolonModelFromJson(Map<String, dynamic> json) =>
    RaporKolonModel(
      json['id'] as int,
      json['kolon'] as String?,
      json['kolonBaslik'] as String?,
      json['kolonTipi'] as String?,
      json['altToplamHesaplansinMi'] as String?,
      json['raporKodu'] as String?,
    );

Map<String, dynamic> _$RaporKolonModelToJson(RaporKolonModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'raporKodu': instance.raporKodu,
      'kolon': instance.kolon,
      'kolonBaslik': instance.kolonBaslik,
      'kolonTipi': instance.kolonTipi,
      'altToplamHesaplansinMi': instance.altToplamHesaplansinMi,
    };
