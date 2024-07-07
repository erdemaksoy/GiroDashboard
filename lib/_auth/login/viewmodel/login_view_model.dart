import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../_kullanici_yonetimi/kullanici_listesi/model/kullanici_listesi_model.dart';
import '../../../core/auth/auth_manager.dart';
import '../../../core/auth/cache_manager.dart';
import '../../../core/components/splash/splash_view.dart';
import '../../../service/auth/auth_service.dart';
import '../model/login_model.dart';

class LoginViewModel extends ChangeNotifier with CacheManager {
  final IAuthService _authService = AuthService();
  String kullaniciAdi = "";
  String sifre = "";
  bool _isRememberMe = false;

  LoginViewModel() {
    loadCredentials();
  }
  bool get isRememberMe => _isRememberMe;

  void updateUserName(String kullaniciAdi) {
    this.kullaniciAdi = kullaniciAdi;
    notifyListeners();
  }

  void updatePassword(String sifre) {
    this.sifre = sifre;
    notifyListeners();
  }

  void setRememberMe(bool value) {
    _isRememberMe = value;
    if (value) {
      saveCredentials();
    } else {
      clearCredentials();
    }
    notifyListeners();
  }

  Future<void> login(BuildContext context) async {
    final response = await _authService.login(LoginModel(kullaniciAdi, sifre));
    if (response.isSucced) {
      if (_isRememberMe) {
        saveCredentials();
      }
      saveToken(response.body);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SplashView()));
      context.read<AuthenticationManager>().model =
          KullaniciListesiModel.real(response.body);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content:
              Text('Lütfen Kullanıcı adınızı ve şifrenizi kontrol ediniz.'),
        ),
      );
    }
  }

  Future<bool> saveCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', kullaniciAdi);
    await prefs.setString('password', sifre);
    await prefs.setBool("isRememberMe", _isRememberMe);
    return true;
  }

  Future<void> loadCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    kullaniciAdi = prefs.getString('username') ?? "";
    sifre = prefs.getString('password') ?? "";
    _isRememberMe = prefs.getBool('isRememberMe') ?? false;
    notifyListeners();
  }

  Future<bool> clearCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('username');
    await prefs.remove('password');
    await prefs.remove('isRememberMe');
    return true;
  }
}
