import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import '../../../service/stok/stok_service.dart';
import '../../stok_request_model.dart';
import '../model/stok_hareket_model.dart';

class StokHareketViewModel extends ChangeNotifier {
  late IStokService _stokService;
  String _searchText = "";
  List<StokHareketModel> models = [];
  String? barkod;
  bool loading = true;
  int? _subeKodu;
  StokHareketViewModel() {
    _stokService = StokService();
  }

  void updateLoad() {
    loading = !loading;
    notifyListeners();
  }

  void updateSearchText(String searchText) {
    _searchText = searchText;
    notifyListeners();
  }

  void updateBarkod(String? barkod) {
    this.barkod = barkod;
    notifyListeners();
  }

  void updateSubeKodu(String? subeKodu) {
    _subeKodu = int.parse(subeKodu ?? '0');
    notifyListeners();
  }

  Future<List<StokHareketModel>> listStokHareket() async {
    final response = await _stokService.getStokHareket(
        StokRequestModel(subeKodu: _subeKodu, barkod: barkod, kullanici: 1));
    return models = response.body;
  }

  Future<void> scanBarcode() async {
    String barcodeScanResult = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', 'İptal', true, ScanMode.BARCODE);

    String numericBarcode = barcodeScanResult.replaceAll(RegExp(r'[^0-9]'), '');

    this.barkod = numericBarcode;
    notifyListeners();
  }

  Future<List<StokHareketModel>> getFilteredData() async {
    if (_searchText.isEmpty) {
      return models;
    } else {
      return models.where((veri) {
        return veri.tarih!.toString().contains(_searchText.toLowerCase()) ||
            veri.belgeNo!.toLowerCase().contains(_searchText.toLowerCase()) ||
            veri.evrakNo!.toLowerCase().contains(_searchText.toLowerCase()) ||
            veri.belgeTipi!.toString().contains(_searchText.toLowerCase()) ||
            veri.belgeAdi!.toLowerCase().contains(_searchText.toLowerCase()) ||
            veri.girenMiktar!.toString().contains(_searchText.toLowerCase()) ||
            veri.cikanMiktar!.toString().contains(_searchText.toLowerCase()) ||
            veri.harBakiye!.toString().contains(_searchText.toLowerCase()) ||
            veri.cariAdi!.toString().contains(_searchText.toLowerCase()) ||
            veri.stokNF!.toString().contains(_searchText.toLowerCase()) ||
            veri.netTutar!.toString().contains(_searchText.toLowerCase()) ||
            veri.stokBF!.toString().contains(_searchText.toLowerCase()) ||
            veri.stokHr_Recno!.toString().contains(_searchText.toLowerCase());
      }).toList();
    }
  }
}
