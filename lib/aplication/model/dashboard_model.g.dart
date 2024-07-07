part of 'dashboard_model.dart';

DashboardModel _$DashboardModelFromJson(Map<String, dynamic> json) =>
    DashboardModel(
      json['label'] as String?,
      json['value'] as double?,
    );

Map<String, dynamic> _$DashboardModelToJson(DashboardModel instance) =>
    <String, dynamic>{
      'label': instance.label,
      'value': instance.value,
    };
