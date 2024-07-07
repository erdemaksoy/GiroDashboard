import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';


import '../../../service/stok/stok_service.dart';
import '../../stok_request_model.dart';
import '../model/gimsa_satis_model.dart';

class GimsaSatisViewModel extends ChangeNotifier {
  late IStokService _stokService;

  List<GimsaSatisModel> models = [];
  String _searchText = "";
  String? barkod;
  String? _urunKodu;
  String? _urunAdi;
  GimsaSatisViewModel() {
    _stokService = StokService();
  }
  void updateBarkod(String barkod) {
    this.barkod = barkod;
    notifyListeners();
  }

  void updateSearchText(String searchText) {
    _searchText = searchText;
    notifyListeners();
  }

  void updateUrunKod(String urunKod) {
    _urunKodu = urunKod;
    notifyListeners();
  }

  void updateUrunAdi(String urunAdi) {
    _urunAdi = urunAdi;
    notifyListeners();
  }

  Future<void> getGimsaSatis() async {
    final response = await _stokService.getStokGimsa(StokRequestModel(
        barkod: this.barkod, urunAdi: _urunAdi, urunKodu: _urunKodu));
    models = response.body;
  }

  Future<void> scanBarcode() async {
    String barcodeScanResult = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', 'İptal', true, ScanMode.BARCODE);

    // Barkod sayılarına filtre uygulayarak sadece rakamları alıyoruz.
    String numericBarcode = barcodeScanResult.replaceAll(RegExp(r'[^0-9]'), '');

    barkod = numericBarcode;
    notifyListeners();
  }

  Future<List<GimsaSatisModel>> getFilteredData() async {
    if (_searchText.isEmpty) {
      return models;
    } else {
      return models.where((veri) {
        return veri.stokNo!.toLowerCase().contains(_searchText.toLowerCase()) ||
            veri.urunKodu!.toLowerCase().contains(_searchText.toLowerCase()) ||
            veri.barkod!.toString().contains(_searchText.toLowerCase()) ||
            veri.urunAdi!.toLowerCase().contains(_searchText.toLowerCase()) ||
            veri.kdvHaricMal!.toString().contains(_searchText.toLowerCase()) ||
            veri.satisFiyati!.toString().contains(_searchText.toLowerCase()) ||
            veri.kdv!.toLowerCase().contains(_searchText.toLowerCase()) ||
            veri.mevcut!.toLowerCase().contains(_searchText.toLowerCase()) ||
            veri.brm!.toLowerCase().contains(_searchText.toLowerCase()) ||
            veri.y2023!.toLowerCase().contains(_searchText.toLowerCase()) ||
            veri.y2022!.toLowerCase().contains(_searchText.toLowerCase()) ||
            veri.y2021!.toLowerCase().contains(_searchText.toLowerCase()) ||
            veri.y2020!.toLowerCase().contains(_searchText.toLowerCase()) ||
            veri.giris2023!.toLowerCase().contains(_searchText.toLowerCase());
      }).toList();
    }
  }
}
