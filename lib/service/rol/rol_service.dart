import 'dart:convert';
import '../../../core/network/http_network_manager.dart';
import '../../_kullanici_yonetimi/rol_ekle/model/rol_ekle_model.dart';
import '../../_kullanici_yonetimi/rol_listesi/model/rol_listesi_model.dart';
import '../../core/auth/cache_manager.dart';
import '../../core/model/response_model.dart';

abstract class IRolSercvice {
  final String _path = "api/Role";
  Future<ResponseModel> getRoles();
  Future<ResponseModel> addRole(RolEkleModel model);
  Future<ResponseModel> editRole(RolListeModel model);
  Future<ResponseModel> deleteRole(RolListeModel model);
}

class RolService extends IRolSercvice with HttpNetworkNManager, CacheManager {
  @override
  Future<ResponseModel> addRole(RolEkleModel model) async {
    return httpPost(model, '$_path/AddRole', await getToken() as String?);
  }

  @override
  Future<ResponseModel> deleteRole(RolListeModel model) async {
    return httpDelete(model, '$_path', await getToken() as String?); //delete
  }

  @override
  Future<ResponseModel> editRole(RolListeModel model) async {
    return httpPut(model, '$_path/EditRole', await getToken() as String?);
  }

  @override
  Future<ResponseModel> getRoles() async {
    final response = await httpGet('$_path/roles', await getToken() as String?);
    if (response.isSucced) {
      List<dynamic> body = jsonDecode(response.body);
      List<RolListeModel> roles =
          body.map((dynamic item) => RolListeModel.fromJson(item)).toList();
      response.body = roles;
      return response;
    } else {
      throw Exception('Failed to load roles');
    }
  }
}
