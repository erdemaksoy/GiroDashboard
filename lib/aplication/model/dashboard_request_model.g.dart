part of 'dashboard_request_model.dart';

DashboardRequestModel _$DashboardRequestModelFromJson(
        Map<String, dynamic> json) =>
    DashboardRequestModel(
      json['musteriId'] as int,
      json['raporTipi'] as int?,
      json['tarih'] == null ? null : DateTime.parse(json['rIdate'] as String),
    );

Map<String, dynamic> _$DashboardRequestModelToJson(
        DashboardRequestModel instance) =>
    <String, dynamic>{
      'musteriId': instance.musteriId,
      'raporTipi': instance.raporTipi,
      'tarih': instance.tarih?.toIso8601String(),
    };
