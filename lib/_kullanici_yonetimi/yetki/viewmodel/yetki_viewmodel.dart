
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../rol_listesi/model/rol_listesi_model.dart';
import '../model/yetki_model.dart';
import '../../../service/yetki/yetki_service.dart';

class YetkiViewModel extends ChangeNotifier {
  List<YetkiModel> listYetki = [];
  late IYetkiService _yetkiService;

  YetkiViewModel() {
    _yetkiService = YetkiService();
  }

  late int _yetkiId;
  late int? _menuId;
  late String? _menuAdi;
  late int? _rolId;
  late bool? kayitYetki;
  late bool? silYetki;
  late bool? guncelleYetki;
  late bool izlemeYetki = false;
  late String? _gorunurMu;
  late String? _controller;

  Future<void> updateKayitYetki(bool? kYetki,int yetkiId,context) async {
    kayitYetki = kYetki;
     for(var item in listYetki){
      if(item.yetkiId == yetkiId){
        item.kayitYetki = kayitYetki;
         final response =await _yetkiService.updateYetki(item);
        if(response.isSucced){
         ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
          content: Text(response.messagge),
          duration: const Duration(seconds: 2),
         ));
      }
    }
   }
   notifyListeners();
 }

  Future<void> updateSilYetki(bool sYetki,int yetkiId,BuildContext context) async {
    silYetki = sYetki;
    for(var item in listYetki){
      if(item.yetkiId == yetkiId){
        item.silYetki = silYetki;
        final response =await _yetkiService.updateYetki(item);
        if(response.isSucced){
         ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
          content: Text(response.messagge),
          duration: const Duration(seconds: 2),
         ));
        }
      }
    }
    notifyListeners();
  }

  Future<void> updateGuncelleYetki(bool guncelYetki,int yetkiId,BuildContext context) async {
    guncelleYetki = guncelYetki;
    for(var item in listYetki){
      if(item.yetkiId == yetkiId){
        item.guncelleYetki = guncelleYetki;
          final response =await _yetkiService.updateYetki(item);
        if(response.isSucced){
         ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
          content: Text(response.messagge),
          duration: const Duration(seconds: 2),
         ));
        }
      }
    }
    notifyListeners();
  }

  Future<void> updateIzlemeYetki(bool izleYetki,int yetkiId,BuildContext context) async {
    izlemeYetki = izleYetki;
    for(var item in listYetki){
      if(item.yetkiId == yetkiId){
        item.izlemeYetki = izlemeYetki;
              final response =await _yetkiService.updateYetki(item);
            if(response.isSucced){
             ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
              content: Text(response.messagge),
              duration: const Duration(seconds: 2),
             )
            );
            }
      }
    }
    notifyListeners();
  }

  Future<List<YetkiModel>> getYetki(RolListeModel model) async {
    final response = await _yetkiService.getYetki(model);
    if (response.isSucced) {
      listYetki = response.body;
    }
    return listYetki;
  }
}
