import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';

import '../../../_kullanici_yonetimi/kullanici_listesi/model/kullanici_listesi_model.dart';
import '../../../core/auth/auth_manager.dart';
import '../../../service/muhasebe/muhasebe_service.dart';
import '../../muhasebe_request_model.dart';
import '../model/kasiyer_performans_model.dart';

class KasiyerPerformansViewModel extends ChangeNotifier {
  late KullaniciListesiModel? user;

  late IMuhasebeService _muhasebeService;
  List<KasiyerPerformansModel> models = [];
  DateTime? basTarih = DateTime.now();
  DateTime? bitTarih = DateTime.now();
  int? _subeKodu;
  String? _barkod;
  KasiyerPerformansViewModel() {
    _muhasebeService = MuhasebeService();
  }
  void updateBasTarih(DateTime basTarih) {
    this.basTarih = basTarih;
    notifyListeners();
  }

  void updateBitTarih(DateTime bitTarih) {
    this.bitTarih = bitTarih;
    notifyListeners();
  }

  void updateSubeKodu(String? subeKodu) {
    _subeKodu = int.parse(subeKodu!);
    notifyListeners();
  }

  void updateBarkod(String? barkod) {
    _barkod = barkod;
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

  Future<void> scanBarcode() async {
    String barcodeScanResult = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', 'İptal', true, ScanMode.BARCODE);

    // Barkod sayılarına filtre uygulayarak sadece rakamları alıyoruz.
    String numericBarcode = barcodeScanResult.replaceAll(RegExp(r'[^0-9]'), '');

    _barkod = numericBarcode;
    notifyListeners();
  }

  Future<void> listKasiyerPerformans(BuildContext context) async {
    user = context.read<AuthenticationManager>().model;
    final response = await _muhasebeService.getKasiyerPerformans(
        MuhasebeRequestModel(
            kullanici: user?.kullaniciNo,
            subeKodu: _subeKodu,
            barkod: _barkod,
            basTarih: basTarih,
            bitTarih: bitTarih));
    models = response.body;
    notifyListeners();
  }
}
