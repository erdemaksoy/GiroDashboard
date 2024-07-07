import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../_kullanici_yonetimi/kullanici_listesi/model/kullanici_listesi_model.dart';
import '../../../core/auth/auth_manager.dart';
import '../../../service/satis/satis_service.dart';
import '../../satis_request_model.dart';
import '../model/saatlik_satis_model.dart';

class SaatlikSatisViewModel extends ChangeNotifier {
  late KullaniciListesiModel? user;
  late ISatisService _satisService;
  List<SaatlikSatisModel> models = [];
  String _searchText = "";
  int? _subeKodu;
  DateTime? tarih = DateTime.now();
  SaatlikSatisViewModel() {
    _satisService = SatisService();
  }

  void updateSearchText(String searchText) {
    _searchText = searchText;
    notifyListeners();
  }

  void updateSubeKodu(String? subeKodu) {
    _subeKodu = int.parse(subeKodu!);
    notifyListeners();
  }

  void updateTarih(DateTime tarih) {
    this.tarih = tarih;
    notifyListeners();
  }

  Future<List<SaatlikSatisModel>> listSaatlikSatis(BuildContext context) async {
    user = context.read<AuthenticationManager>().model;
    final response = await _satisService.getSaatlikSatis(SatisRequestModel(
        kullanici: user?.kullaniciNo, subeKodu: _subeKodu, tarih: tarih));
    return models = response.body;
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

  Future<List<SaatlikSatisModel>> getFilteredData() async {
    if (_searchText.isEmpty) {
      return models;
    } else {
      return models.where((veri) {
        return veri.tarih!.toString().contains(_searchText.toLowerCase()) ||
            veri.saat!.toLowerCase().contains(_searchText.toLowerCase()) ||
            veri.musSay!.toString().contains(_searchText.toLowerCase()) ||
            veri.sepetOrt!.toString().contains(_searchText.toLowerCase()) ||
            veri.ciro!.toString().contains(_searchText.toLowerCase()) ||
            veri.yemekKarti!.toString().contains(_searchText.toLowerCase()) ||
            veri.toplamSepet!.toString().contains(_searchText.toLowerCase());
      }).toList();
    }
  }
}
