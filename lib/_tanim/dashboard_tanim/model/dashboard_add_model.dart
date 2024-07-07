import 'dart:convert';

import '../../../core/base/base_model.dart';


part 'dashboard_add_model.g.dart';

class DashboardAddModel extends BaseModel {
  int id = 0;
  String? raporAdi;
  String? raporBaslik;
  String? raporProc;
  int? raporTipi;
  String? aciklama;
  int? raporSiraNo;
  bool aktifPasif = false;
  int? siraNo;
  String? genislik;
  String? ikon;
  int? procedureSira;

  DashboardAddModel(
      {required this.id,
      this.raporAdi,
      this.raporBaslik,
      this.raporProc,
      this.raporTipi,
      this.aciklama,
      this.raporSiraNo,
      required this.aktifPasif,
      this.siraNo,
      this.genislik,
      this.ikon,
      this.procedureSira});

  Map<String, dynamic> toJson() => _$DashboardAddModelToJson(this);

  factory DashboardAddModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardAddModelFromJson(json);

  @override
  String myJson() => jsonEncode(toJson());
}
