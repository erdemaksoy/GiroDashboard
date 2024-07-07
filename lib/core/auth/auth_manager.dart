import 'package:flutter/material.dart';


import '../../_kullanici_yonetimi/kullanici_listesi/model/kullanici_listesi_model.dart';
import '../../_kullanici_yonetimi/yetki/model/yetki_model.dart';
import 'cache_manager.dart';

class AuthenticationManager extends ChangeNotifier with CacheManager {
  BuildContext context;
  AuthenticationManager({
    required this.context,
  }) {
    fetchUserLogin();
  }

  bool isLogin = false;
  KullaniciListesiModel? model;
  List<YetkiModel> yetkiModel = [];

  void removeAllData() {}
  Future<void> fetchUserLogin() async {
    final token = await getToken();
    if (token != null) {
      isLogin = true;
    }
  }
}
