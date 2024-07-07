import 'package:flutter/material.dart';
import 'package:girodashboard/_tanim/dashboard_tanim/model/dashboard_add_model.dart';
import 'package:girodashboard/aplication/model/dashboard_model.dart';
import 'package:girodashboard/aplication/model/dashboard_request_model.dart';
import 'package:girodashboard/service/dashboard/dashboard_service.dart';

import '../../core/components/alert/show_alert_diolog.dart';

class DashboardViewModel extends ChangeNotifier {
  late IDashboardService _dashboardService;
  int? _musteriId;
  int? raporTipi;
  DateTime? tarih = DateTime.now();
  List<DashboardAddModel> dashsNames = [];
  DashboardViewModel() {
    _dashboardService = DashboardService();
  }

  Future<void> updateRaporTipi(String raporAdi) async {
     List<DashboardAddModel> raporTips=await getDashNames();
     raporTipi = raporTips.singleWhere((element) => element.raporAdi == raporAdi).procedureSira;
    notifyListeners();
  }

  void updateTarih(DateTime? tarih) {
    this.tarih = tarih;
    notifyListeners();
  }

  void updateMusteriId(int id) {
    _musteriId = id;
    notifyListeners();
  }

  Future<List<DashboardModel>> getCharts(BuildContext context) async {
    final response = await _dashboardService.getDashboardData(
        DashboardRequestModel(_musteriId, raporTipi, tarih));
    if (tarih == null) {
      response.messagge = "Tarih girişi yapmalısınız";
      showAlertDialog(context, response);
    } else if (!response.isSucced) {
      //showAlertDialog(context, response);
     
      List<DashboardModel> errordash = [];
     
      response.body  = errordash;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(response.messagge),
        duration: const Duration(seconds: 2),
      ));
    }
    return response.body;
  }
    Future<List<DashboardAddModel>> getDashNames() async {
    final response = await _dashboardService.getDashboards();
    if (response.isSucced) {
      dashsNames = response.body;
    }
    return dashsNames;
  }
}
