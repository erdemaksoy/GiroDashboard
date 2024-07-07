import 'package:flutter/material.dart';

import '../../../core/components/alert/show_alert_diolog.dart';
import '../../../core/components/alert/show_delete_dialog.dart';
import '../../../service/tanim/tanim_service.dart';
import '../../rapor_filtre_tanim/view/rapor_filtre_tanim_view.dart';
import '../../rapor_kolon_tanim/view/rapor_kolon_tanim_view.dart';
import '../model/rapor_tanim_model.dart';

class RaporViewModel extends ChangeNotifier {
  late ITanimService _tanimService;
  String? _searchText = '';
  String? grupKodu;
  String? raporKodu;
  String? _raporAdi;
  String? _sQLProsedurAdi;
  String? _filtre;
  String? _gosterimTipi;
  List<RaporTanimModel> models = [];
  bool loading = true;
  RaporViewModel() {
    _tanimService = TanimService();
  }
  void updateGrupKodu(String? grupKodu) {
    this.grupKodu = grupKodu;
    notifyListeners();
  }

  void updateSearchText(String searcText) {
    _searchText = searcText;
    notifyListeners();
  }

  void updateRaporKodu(String raporKodu) {
    this.raporKodu = raporKodu;
  }

  void updateRaporAdi(String raporAdi) {
    _raporAdi = raporAdi;
    notifyListeners();
  }

  void updateSQLProsedurAdi(String sQLProsedurAdi) {
    _sQLProsedurAdi = "EXEC $sQLProsedurAdi";
    notifyListeners();
  }

  void updateFiltre(String filtre) {
    _filtre = filtre;
    notifyListeners();
  }

  void updateGosterimTipi(String? gosterimTipi) {
    _gosterimTipi = gosterimTipi;
    notifyListeners();
  }

  void updateLoad() {
    loading = !loading;
    notifyListeners();
  }

  Future<void> addRapor(BuildContext context) async {
    final response = await _tanimService.addRapor(RaporTanimModel(grupKodu,
        raporKodu, _raporAdi, _sQLProsedurAdi, _filtre, _gosterimTipi));
    showAlertDialog(context, response);
  }

  Future<List<RaporTanimModel>> listRapor() async {
    final response = await _tanimService.getRapor();
    if (response.isSucced) {
      models = response.body;
    }
    return models;
  }

  Future<void> actionsValueSelect(
      String value, RaporTanimModel veri, BuildContext context) async {
    if (value == 'Kolon Tanımları') {
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                Kolon(raporKodu: veri.raporKodu ?? "", id: 1)),
      );
    } else if (value == 'Filtre Tanımları') {
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Filtre(raporKodu: veri.raporKodu ?? "")),
      );
    } else if (value == 'delete') {
      final shouldDelete = await showDeleteDialog(context);
      if (shouldDelete) {
        final response = await _tanimService.deleteRapor(veri);
        showAlertDialog(context, response);
        notifyListeners();
      }
    }
    notifyListeners();
  }

  Future<List<RaporTanimModel>> getFilteredData() async {
    if (_searchText!.isEmpty) {
      return models;
    } else {
      return models.where((veri) {
        return veri.grupKodu!
                .toLowerCase()
                .contains(_searchText!.toLowerCase()) ||
            veri.raporKodu!
                .toLowerCase()
                .contains(_searchText!.toLowerCase()) ||
            veri.raporAdi!.toLowerCase().contains(_searchText!.toLowerCase());
      }).toList();
    }
  }
}
