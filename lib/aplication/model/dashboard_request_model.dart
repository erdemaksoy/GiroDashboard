import 'dart:convert';

import '../../core/base/base_model.dart';

part 'dashboard_request_model.g.dart';

class DashboardRequestModel extends BaseModel {
  final int? musteriId;
  final int? raporTipi;
  final DateTime? tarih;

  DashboardRequestModel(this.musteriId, this.raporTipi, this.tarih);

  Map<String, dynamic> toJson() => _$DashboardRequestModelToJson(this);

  factory DashboardRequestModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardRequestModelFromJson(json);

  @override
  String myJson() => jsonEncode(toJson());
}
