import 'package:flutter/material.dart';

import '../../../core/components/alert/show_alert_diolog.dart';
import '../../../core/components/alert/show_delete_dialog.dart';
import '../../../service/tanim/tanim_kolon_service.dart';
import '../model/rapor_kolon_tanim_model.dart';

class RaporKolonViewModel extends ChangeNotifier {
  String? _kolon;
  String? raporKodu;
  String? kolonBaslik;
  String? _kolonTipi;
  String? _altToplamHesaplansinMi;
  String? _searchText = '';
  List<RaporKolonModel> models = [];

  late ITanimKolonService _raporKolonService;

  RaporKolonViewModel() {
    _raporKolonService = TanimKolonService();
  }
  void updateKolon(String kolon) {
    _kolon = kolon;
    notifyListeners();
  }

  void updateSearchText(String searcText) {
    _searchText = searcText;
    notifyListeners();
  }

  void updateKolonBaslik(String kolonBaslik) {
    this.kolonBaslik = kolonBaslik;
    notifyListeners();
  }

  void updateKolonTipi(String? kolonTipi) {
    _kolonTipi = kolonTipi;
    notifyListeners();
  }

  void updateAltToplamHesaplansinMi(String? altToplamHesaplansinMi) {
    _altToplamHesaplansinMi = altToplamHesaplansinMi;
    notifyListeners();
  }

  Future<void> addKolon(BuildContext context, String raporKodu, int id) async {
    final response = await _raporKolonService.addRaporKolon(RaporKolonModel(id,
        _kolon, kolonBaslik, _kolonTipi, _altToplamHesaplansinMi, raporKodu));
    showAlertDialog(context, response);
  }

  Future<List<RaporKolonModel>> listRaporKolon(String raporKodu) async {
    final response = await _raporKolonService.getRaporKolon(raporKodu);
    if (response.isSucced) {
      models = response.body;
    }
    return models;
  }

  Future<List<RaporKolonModel>> getFilteredData() async {
    if (_searchText!.isEmpty) {
      return models;
    } else {
      return models.where((veri) {
        return veri.kolon!.toLowerCase().contains(_searchText!.toLowerCase()) ||
            veri.kolonBaslik!
                .toLowerCase()
                .contains(_searchText!.toLowerCase()) ||
            veri.kolonTipi!
                .toLowerCase()
                .contains(_searchText!.toLowerCase()) ||
            veri.altToplamHesaplansinMi!
                .toLowerCase()
                .contains(_searchText!.toLowerCase());
      }).toList();
    }
  }

  Future<void> deleteKolon(BuildContext context, RaporKolonModel model) async {
    final shouldDelete = await showDeleteDialog(context);
    if (shouldDelete) {
      final response = await _raporKolonService.deleteRaporKolon(model);
      showAlertDialog(context, response);
    }
  }
}
