import 'package:flutter/material.dart';

import '../../../core/components/alert/show_alert_diolog.dart';
import '../../../core/components/alert/show_delete_dialog.dart';
import '../../../service/rol/rol_service.dart';
import '../../rol_ekle/model/rol_ekle_model.dart';
import '../../yetki/view/yetki_view.dart';
import '../model/rol_listesi_model.dart';

class RolListeViewModel extends ChangeNotifier {
  late IRolSercvice _rolService;
  List<RolListeModel> roles = [];
  String _searchText = "";
  RolListeModel? rolGuncelle;
  String? _rolAciklama;
  RolListeViewModel() {
    _rolService = RolService();
  }

  void updateSearchText(String searchText) {
    _searchText = searchText;
    notifyListeners();
  }

  Future<void> actionsValueSelect(
      BuildContext context, String value, RolListeModel veri) async {
    if (value == 'edit') {
      rolGuncelle = veri;
      notifyListeners();
    } else if (value == 'Yetki') {
      Navigator.pop(context);
      Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) => YetkiPage(
                  model: veri,
                )),
      );
    } else if (value == 'delete') {
      final shouldDelete = await showDeleteDialog(context);
      if (shouldDelete) {
        final response = await _rolService.deleteRole(veri);
        showAlertDialog(context, response);
        notifyListeners();
      }
      notifyListeners();
    }
  }

  Future<List<RolListeModel>> listRoles() async {
    final response = await _rolService.getRoles();
    if (response.isSucced) {
      roles = response.body;
    }

    return roles;
  }

  void resetGuncelle() {
    rolGuncelle = null;
    notifyListeners();
  }

  void updateRol(String rolAciklma) {
    _rolAciklama = rolAciklma;
    notifyListeners();
  }

  Future<void> editRole(BuildContext context) async {
    final response = await _rolService.editRole(rolGuncelle!);
    showAlertDialog(context, response);
  }

  Future<void> addRole(BuildContext context) async {
    final response = await _rolService.addRole(RolEkleModel(_rolAciklama));
    showAlertDialog(context, response);
  }

  Future<List<RolListeModel>> getFilteredData() async {
    if (roles.isNotEmpty) {
      if (_searchText.isEmpty) {
        return roles;
      } else {
        return roles.where((veri) {
          return veri.rolAciklama!
              .toLowerCase()
              .contains(_searchText.toLowerCase());
        }).toList();
      }
    } else {
      throw Exception("rol list failed to");
    }
  }
}
