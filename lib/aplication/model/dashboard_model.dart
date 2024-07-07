import 'dart:convert';

import '../../core/base/base_model.dart';



part 'dashboard_model.g.dart';

class DashboardModel extends BaseModel {
  String? label;
  double? value;

  DashboardModel(this.label, this.value);

  Map<String, dynamic> toJson() => _$DashboardModelToJson(this);

  factory DashboardModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardModelFromJson(json);

  @override
  String myJson() => jsonEncode(toJson());
}
