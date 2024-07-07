import 'package:flutter/material.dart';

import '../../../core/components/alert/show_alert_diolog.dart';
import '../../../core/components/alert/show_delete_dialog.dart';
import '../../../service/kullanici_yonetimi/kullanici_yonetimi_service.dart';
import '../../kullanici_ekle/view/kullanici_ekle_view.dart';
import '../model/kullanici_listesi_model.dart';

class KullaniciListeleViewModel extends ChangeNotifier {
  late IKullaniciYonetimiService _kullaniciYonetimiService;
  String _searchText = "";
  bool loading = true;

  List<KullaniciListesiModel> users = [];
  KullaniciListeleViewModel() {
    _kullaniciYonetimiService = KullaniciYonetimiService();
  }

  void updateloading() {
    loading = !loading;
    notifyListeners();
  }

  void updateSearchText(String searchText) {
    _searchText = searchText;
    notifyListeners();
  }

  Future<void> actionsValueSelect(
      String value, KullaniciListesiModel veri, BuildContext context) async {
    if (value == 'edit') {
      final response = await _kullaniciYonetimiService.getUserforEdit(veri);
      if (response.isSucced) {
        Navigator.of(context).pop();
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => KullaniciEklePage(veri: response.body)),
        );
      } // Implement your edit logic here
    } else if (value == 'delete') {
      final shouldDelete = await showDeleteDialog(context);
      final response = await _kullaniciYonetimiService.getUserforEdit(veri);
      if (response.isSucced) {
        if (shouldDelete) {
          final responseDelete =
              await _kullaniciYonetimiService.deleteUser(response.body);
          showAlertDialog(context, responseDelete);
          notifyListeners();
        }
      }
    }
    notifyListeners();
  }

  Future<List<KullaniciListesiModel>> listUser() async {
    final response = await _kullaniciYonetimiService.getUsers();
    if (response.isSucced) {
      users = response.body;
    }
    return users;
  }

  Future<List<KullaniciListesiModel>> getFilteredData() async {
    if (_searchText.isEmpty) {
      return users;
    } else {
      return users.where((veri) {
        return veri.kullaniciAdi!
                .toLowerCase()
                .contains(_searchText.toLowerCase()) ||
            veri.kullaniciIsim!
                .toLowerCase()
                .contains(_searchText.toLowerCase()) ||
            veri.rolId!.toString().contains(_searchText.toLowerCase()) ||
            veri.kullaniciNo.toString().contains(_searchText.toLowerCase());
      }).toList();
    }
  }
}
