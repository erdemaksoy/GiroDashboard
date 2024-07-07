import 'package:flutter/material.dart';

import '../../../service/muhasebe/muhasebe_service.dart';
import '../../muhasebe_request_model.dart';
import '../model/kasiyer_acik_model.dart';

class KasiyerAcikViewModel extends ChangeNotifier {
  late IMuhasebeService _muhasebeService;
  List<KasiyerAcikModel> models = [];
  DateTime? basTarih = DateTime.now();
  DateTime? bitTarih = DateTime.now();
  int? _subeKodu;
  KasiyerAcikViewModel() {
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

  Future<void> listKasiyeracik() async {
    final response = await _muhasebeService.getKasiyerAcik(MuhasebeRequestModel(
        kullanici: 1,
        subeKodu: _subeKodu,
        tarih: basTarih,
        basTarih: basTarih,
        bitTarih: bitTarih,
        barkod: ""));
    models = response.body;
    notifyListeners();
  }
}
