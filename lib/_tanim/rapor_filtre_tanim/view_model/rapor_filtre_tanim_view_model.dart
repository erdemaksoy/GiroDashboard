import 'package:flutter/material.dart';

import '../../../core/components/alert/show_alert_diolog.dart';
import '../../../core/components/alert/show_delete_dialog.dart';
import '../../../service/tanim/tanim_flitre_service.dart';
import '../model/rapor_filtre_tanim_model.dart';

class RaporFiltreViewModel extends ChangeNotifier {
  late ITanimFlitreService _raporFiltreService;
  String? _filtreBaslik;
  String? _filtreTipi;
  String? _filtreDeger;
  String? _varsayilanDeger;
  int? _sira = 0;
  String? _filtreKodu;
  bool loading = true;
  List<RaporFiltreTanimModel> models = [];

  RaporFiltreViewModel() {
    _raporFiltreService = TanimFiltreService();
  }

  void updateFiltreBaslik(String filtreBaslik) {
    _filtreBaslik = filtreBaslik;
    notifyListeners();
  }

  void updateFiltreTipi(String? filtreTipi) {
    _filtreTipi = filtreTipi;
    notifyListeners();
  }

  void updateFiltreDeger(String filtreDeger) {
    _filtreDeger = filtreDeger;
    notifyListeners();
  }

  void updateVarsayilanDeger(String varsayilanDeger) {
    _varsayilanDeger = varsayilanDeger;
    notifyListeners();
  }

  void updateFiltreKodu(String filtreKodu) {
    _filtreKodu = filtreKodu;
    notifyListeners();
  }

  void updateSira(String sira) {
    _sira = int.parse(sira);
    notifyListeners();
  }

  void updateLoad() {
    loading = !loading;
    notifyListeners();
  }

  Future<void> listRaporFlitre(String raporKodu) async {
    final response = await _raporFiltreService.getRaporFiltre(raporKodu);
    if (response.isSucced) {
      models = response.body;
    }
    notifyListeners();
  }

  Future<void> addFiltre(BuildContext context, String raporKodu, int id) async {
    final response = await _raporFiltreService.addRaporFiltre(
        RaporFiltreTanimModel(id, _filtreBaslik, _filtreTipi, _filtreDeger,
            _varsayilanDeger, _sira, _filtreKodu, raporKodu));
    showAlertDialog(context, response);
  }

  Future<void> deleteFiltre(
      RaporFiltreTanimModel veri, BuildContext context) async {
    final shouldDelete = await showDeleteDialog(context);
    if (shouldDelete) {
      final response = await _raporFiltreService.deleteRaporFiltre(veri);
      showAlertDialog(context, response);
      notifyListeners();
    }
  }
}
