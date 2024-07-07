import 'package:flutter/material.dart';

import '../../../core/components/alert/show_alert_diolog.dart';
import '../../../core/components/alert/show_delete_dialog.dart';
import '../../../service/tanim/tanim_grup_service.dart';
import '../model/rapor_grup_tanim_model.dart';

class RaporGrupViewModel extends ChangeNotifier {
  late ITanimGrupService _raporGrupService;
  List<RaporGrupTanimModel> grups = [];
  String? _searchText = '';
  String _grupKodu = "";
  String _grupAciklama = "";
  bool loading = true;
  RaporGrupTanimModel? guncelle;
  bool Sure = false;
  RaporGrupViewModel() {
    _raporGrupService = TanimGrupService();
  }
  void updateSearchText(String searcText) {
    _searchText = searcText;
    notifyListeners();
  }

  void updateGrupKodu(String grupKodu) {
    _grupKodu = grupKodu;
    notifyListeners();
  }

  void updateGrupAciklama(String grupAciklama) {
    _grupAciklama = grupAciklama;
    notifyListeners();
  }

  void updateLoad() {
    loading = !loading;
    notifyListeners();
  }

  void resetGuncelle() {
    guncelle = null;
    notifyListeners();
  }

  Future<void> actionsValueSelect(
      String value, RaporGrupTanimModel veri, BuildContext context) async {
    if (value == 'edit') {
      guncelle = veri;
      notifyListeners();
    } else if (value == 'delete') {
      final shouldDelete = await showDeleteDialog(context);
      if (shouldDelete) {
        final response = await _raporGrupService.deleteRaporGrup(veri);
        showAlertDialog(context, response);
        notifyListeners();
      }
    }
  }

  Future<void> editGrup(BuildContext context) async {
    final response = await _raporGrupService.editRaporGrup(guncelle!);
    showAlertDialog(context, response);
  }

  Future<void> addGrup(BuildContext context) async {
    final response = await _raporGrupService
        .addRaporGrup(RaporGrupTanimModel(_grupKodu, _grupAciklama, 2));
    showAlertDialog(context, response);
  }

  Future<List<RaporGrupTanimModel>> listRaporGrup() async {
    final response = await _raporGrupService.getRaporGrup();
    if (response.isSucced) {
      grups = response.body;
    }
    return grups;
  }

  Future<List<RaporGrupTanimModel>> getFilteredData() async {
    if (_searchText!.isEmpty) {
      return grups;
    } else {
      return grups.where((veri) {
        return veri.grupAciklama!
                .toLowerCase()
                .contains(_searchText!.toLowerCase()) ||
            veri.grupKodu!.toLowerCase().contains(_searchText!.toLowerCase());
      }).toList();
    }
  }
}
