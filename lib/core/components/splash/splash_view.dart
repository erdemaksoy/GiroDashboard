import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../_auth/login/view/login_view.dart';
import '../../../_home/dashboard/view/home_view.dart';
import '../../../_kullanici_yonetimi/kullanici_listesi/model/kullanici_listesi_model.dart';
import '../../../_kullanici_yonetimi/rol_listesi/model/rol_listesi_model.dart';
import '../../../service/yetki/yetki_service.dart';
import '../../auth/auth_manager.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Future<void> controlToApp() async {
    await readAuthManager.fetchUserLogin();
    if (readAuthManager.isLogin) {
      await Future.delayed(Duration(seconds: 2));
      String? token = await readAuthManager.getToken();
      readAuthManager.model = KullaniciListesiModel.real(token ?? "");
      IYetkiService yetkiService = YetkiService();
      final r = await yetkiService.getYetki(RolListeModel(
          readAuthManager.model!.rolId!,
          DateTime.now(),
          1,
          DateTime.now(),
          1,
          ""));
      if (r.isSucced) {
        readAuthManager.yetkiModel = r.body;
      }
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => HomeView()));
    } else {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => LoginPage()));
    }
  }

  AuthenticationManager get readAuthManager =>
      context.read<AuthenticationManager>();

  @override
  void initState() {
    super.initState();
    controlToApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
