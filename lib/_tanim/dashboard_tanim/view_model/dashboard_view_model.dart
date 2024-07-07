import 'package:flutter/material.dart';


import '../../../core/components/alert/show_alert_diolog.dart';
import '../../../core/components/alert/show_delete_dialog.dart';
import '../../../core/model/response_model.dart';
import '../../../service/dashboard/dashboard_service.dart';
import '../model/dashboard_add_model.dart';

class DashboardTanimViewModel extends ChangeNotifier {
  late IDashboardService _dashboardService;
  late int id;
  String? _searchText = '';
  String? _raporAdi;
  String? _raporBaslik;
  String? _raporProc;
  int? _raporTipi;
  String? _aciklama;
  int? _raporSiraNo;
  bool aktifPasif = false;
  int? _siraNo;
  String? _genislik;
  String? _ikon;
  List<DashboardAddModel> models = [];
  DashboardAddModel? editDash;
  bool loading = true;
  DashboardTanimViewModel() {
    _dashboardService = DashboardService();
  }

  void updateSearchText(String searcText) {
    _searchText = searcText;
    notifyListeners();
  }

  void updateRaporAdi(String? raporAdi) {
    _raporAdi = raporAdi;
    notifyListeners();
  }

  void updateRaporBaslik(String? raporBaslik) {
    _raporBaslik = raporBaslik;
    notifyListeners();
  }

  void updateRaporProc(String? raporProc) {
    _raporProc = raporProc;
    notifyListeners();
  }

  void updateRaporTipi(String? raporTipi) {
    _raporTipi = int.parse(raporTipi!);
    notifyListeners();
  }

  void updateAciklama(String? aciklama) {
    _aciklama = aciklama;
    notifyListeners();
  }

  void updateRaporSiraNo(String? raporSiraNo) {
    _raporSiraNo = int.parse(raporSiraNo!);
    notifyListeners();
  }

  void updateAktifPasif() {
    aktifPasif = !aktifPasif;
    notifyListeners();
  }

  void updateSiraNo(String? siraNo) {
    _siraNo = int.parse(siraNo!);
    notifyListeners();
  }

  void updateGenislik(String? genislik) {
    _genislik = genislik;
    notifyListeners();
  }

  void updateIkon(String? ikon) {
    _ikon = ikon;
    notifyListeners();
  }

  void updateLoad() {
    loading = !loading;
    notifyListeners();
  }

  Future<ResponseModel> addDashboard(BuildContext context) async {
    final response = await _dashboardService.addDashboard(DashboardAddModel(
        id: 0,
        raporAdi: _raporAdi,
        raporBaslik: _raporBaslik,
        raporProc: _raporProc,
        raporTipi: _raporTipi,
        raporSiraNo: _raporSiraNo,
        aciklama: _aciklama,
        genislik: _genislik,
        ikon: _ikon,
        aktifPasif: aktifPasif,
        siraNo: _siraNo));
    return response;
  }

  Future<List<DashboardAddModel>> listDashboard() async {
    final response = await _dashboardService.getDashboards();
    if (response.isSucced) {
      models = response.body;
    }
    return models;
  }

  Future<List<DashboardAddModel>> getFilteredData() async {
    if (_searchText!.isEmpty) {
      return models;
    } else {
      return models.where((veri) {
        return veri.raporAdi!
                .toLowerCase()
                .contains(_searchText!.toLowerCase()) ||
            veri.siraNo!.toString().contains(_searchText!.toLowerCase());
      }).toList();
    }
  }

  Future<void> editDashboard(BuildContext context) async {
    final response = await _dashboardService.editDashboard(editDash!);
    showAlertDialog(context, response);
  }

  Future<void> actionsValueSelect(
      String value, DashboardAddModel veri, BuildContext context) async {
    if (value == 'update') {
      editDash = veri;
      notifyListeners();
    } else if (value == 'delete') {
      final shouldDelete = await showDeleteDialog(context);
      if (shouldDelete) {
        final response = await _dashboardService.deleteDashboard(veri);
        showAlertDialog(context, response);
        notifyListeners();
      }
    }
  }
}
