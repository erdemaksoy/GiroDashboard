import 'package:flutter/material.dart';

import '../../../service/stok/stok_service.dart';
import '../../stok_request_model.dart';
import '../model/en_cok_satan_model.dart';

class EnCokSatanViewModel extends ChangeNotifier {
  late IStokService _stokService;
  DateTime? tarih = DateTime.now();
  String _searchText = "";
  int? _subeKodu;
  List<EnCokSatanModel> models = [];
  EnCokSatanViewModel() {
    _stokService = StokService();
  }
  void updateTarih(DateTime tarih) {
    this.tarih = tarih;
    notifyListeners();
  }

  void updateSubeKodu(String? subeKodu) {
    _subeKodu = int.parse(subeKodu ?? '0');
    notifyListeners();
  }

  Future<DateTime> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      return picked;
    } else {
      return DateTime.now();
    }
  }

  void updateSearchText(String searchText) {
    _searchText = searchText;
    notifyListeners();
  }

  Future<List<EnCokSatanModel>> listEnCokSatan() async {
    final response = await _stokService.getStokEnCokSatan(
        StokRequestModel(kullanici: 1, subeKodu: _subeKodu, tarih: tarih));
    return models = response.body;
  }

  Future<List<EnCokSatanModel>> getFilteredData() async {
    if (_searchText.isEmpty) {
      return models;
    } else {
      return models.where((veri) {
        return veri.stokKodu!
                .toLowerCase()
                .contains(_searchText.toLowerCase()) ||
            veri.satisTutari!.toString().contains(_searchText.toLowerCase()) ||
            veri.stokAdi!.toLowerCase().contains(_searchText.toLowerCase()) ||
            veri.satisMiktari!.toString().contains(_searchText.toLowerCase());
      }).toList();
    }
  }
}
