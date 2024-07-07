import 'package:flutter/material.dart';


import '../../../core/components/alert/show_alert_diolog.dart';
import '../../../service/rol/rol_service.dart';
import '../../../service/yetki/yetki_service.dart';
import '../../rol_listesi/model/rol_listesi_model.dart';
import '../model/rol_ekle_model.dart';

class RolEkleViewModel extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  late IRolSercvice _rolSercvice;
  late IYetkiService _yetkiService;
  RolEkleViewModel() {
    _rolSercvice = RolService();
    _yetkiService = YetkiService();
  }
  String? _rolAciklama;

  void updateRol(String rolAciklma) {
    _rolAciklama = rolAciklma;
    notifyListeners();
  }

  Future<void> addRole(BuildContext context) async {
    final response = await _rolSercvice.addRole(RolEkleModel(_rolAciklama));
    final role = await _rolSercvice.getRoles();
    List<RolListeModel> rol = role.body;
    RolListeModel listeModel =
        rol.singleWhere((element) => element.rolAciklama == _rolAciklama);
    final yetki = await _yetkiService.yetkiEkle(listeModel);
    showAlertDialog(context, yetki);
  }
}
