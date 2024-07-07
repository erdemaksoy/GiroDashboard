import 'dart:convert';

import '../../../core/network/http_network_manager.dart';
import '../../_kullanici_yonetimi/kullanici_ekle/model/kullanici_ekle_model.dart';
import '../../_kullanici_yonetimi/kullanici_listesi/model/kullanici_listesi_model.dart';
import '../../core/auth/cache_manager.dart';
import '../../core/model/response_model.dart';

abstract class IKullaniciYonetimiService {
  final String _path = "api/User";
  Future<ResponseModel> addUser(KullaniciEkleModel model);
  Future<ResponseModel> editUser(KullaniciEkleModel model);
  Future<ResponseModel> deleteUser(KullaniciEkleModel model);
  Future<ResponseModel> getUsers();
  Future<ResponseModel> getUserforEdit(KullaniciListesiModel model);
}

class KullaniciYonetimiService extends IKullaniciYonetimiService
    with HttpNetworkNManager, CacheManager {
  @override
  Future<ResponseModel> addUser(KullaniciEkleModel model) async {
    return httpPost(model, '$_path/AddUser', await getToken() as String?);
  }

  @override
  Future<ResponseModel> deleteUser(KullaniciEkleModel model) async {
    return httpDelete(model, '$_path/DeleteUser', await getToken() as String?);
  }

  @override
  Future<ResponseModel> editUser(KullaniciEkleModel model) async {
    return httpPut(model, '$_path/EditUser', await getToken() as String?);
  }

  @override
  Future<ResponseModel> getUsers() async {
    print(await getToken());
    final response =
        await httpGet('$_path/GetUsers', await getToken() as String?);

    if (response.isSucced) {
      final List<dynamic> body = jsonDecode(response.body);
      print(body);
      List<KullaniciListesiModel> users = body
          .map((json) =>
              KullaniciListesiModel.fromJson(json as Map<String, dynamic>))
          .toList();
      print(users);
      response.body = users;
      return response;
    } else {
      throw Exception('Failed to load users');
    }
  }

  @override
  Future<ResponseModel> getUserforEdit(KullaniciListesiModel model) async {
    final response =
        await httpPost(model, '$_path/GetUserforEdit', await getToken());
    final body = jsonDecode(response.body);
    response.body = KullaniciEkleModel.fromJson(body as Map<String, dynamic>);
    return response;
  }
}
