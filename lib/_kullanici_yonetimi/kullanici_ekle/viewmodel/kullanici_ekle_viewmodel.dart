import 'package:flutter/material.dart';


import '../../../core/components/alert/show_alert_diolog.dart';
import '../../../service/kullanici_yonetimi/kullanici_yonetimi_service.dart';
import '../model/kullanici_ekle_model.dart';

class KullaniciEkleViewModel extends ChangeNotifier {
  late IKullaniciYonetimiService _kullaniciYonetimiService;

  KullaniciEkleViewModel() {
    _kullaniciYonetimiService = KullaniciYonetimiService();
  }
  String? _kullKodu;
  String? _kullParola;
  String? _kullAdi;
  int? _kullRolid;
  String? _kullEposta;
  String? _kullTelefon;
  String? _acikSubeler;
  String? _sifreDegistiMi;
  String? _dashboardYetki;
  String? _varsayilanRaporId;
  String? _kullResim;
  void updateKullKod(String kullKodu) {
    _kullKodu = kullKodu;
    notifyListeners();
  }

  void updateKullParola(String kullParola) {
    _kullParola = kullParola;
    notifyListeners();
  }

  void updateKullAdi(String kullAdi) {
    _kullAdi = kullAdi;
    notifyListeners();
  }

  void updateKullRolid(String? kullRolid) {
    _kullRolid = int.parse(kullRolid ?? "0");
    notifyListeners();
  }

  void updateKullEposta(String? kullEposta) {
    _kullEposta = kullEposta;
    notifyListeners();
  }

  void updateKullTelefon(String? kullTelefon) {
    _kullTelefon = kullTelefon;
    notifyListeners();
  }

  void updateAcikSubeler(String? acikSubeler) {
    _acikSubeler = acikSubeler;
    notifyListeners();
  }

  void updateSifreDegistiMi(String? sifreDegistiMi) {
    _sifreDegistiMi = sifreDegistiMi;
    notifyListeners();
  }

  void updateDashboardYetki(String? dashboardYetki) {
    _dashboardYetki = dashboardYetki;
    notifyListeners();
  }

  void updateVarsayilanRaporId(String varsayilanRaporId) {
    _varsayilanRaporId = varsayilanRaporId;
    notifyListeners();
  }

  void updateKullResim(String? kullResim) {
    _kullResim = kullResim;
    notifyListeners();
  }

  Future<void> addUser(BuildContext context) async {
    final response = await _kullaniciYonetimiService.addUser(KullaniciEkleModel(
      0,
      _kullKodu,
      _kullParola,
      _kullAdi,
      _kullRolid,
      _kullEposta,
      _kullTelefon,
      _acikSubeler,
      _sifreDegistiMi,
      _dashboardYetki,
      _varsayilanRaporId,
      _kullResim,
    ));
    showAlertDialog(context, response);
  }

  Future<void> editUser(BuildContext context, KullaniciEkleModel model) async {
    final response =
        await _kullaniciYonetimiService.editUser(KullaniciEkleModel(
      model.kullId,
      model.kullKodu,
      model.kullParola,
      model.kullAdi,
      model.kullRolid,
      model.kullEposta,
      model.kullTelefon,
      model.acikSubeler,
      model.sifreDegistiMi,
      model.dashboardYetki,
      model.varsayilanRaporId,
      model.kullResim,
    ));
    showAlertDialog(context, response);
  }
}
