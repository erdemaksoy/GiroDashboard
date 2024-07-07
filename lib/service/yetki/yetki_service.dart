import 'dart:convert';
import '../../../core/network/http_network_manager.dart';
import '../../_kullanici_yonetimi/rol_listesi/model/rol_listesi_model.dart';
import '../../_kullanici_yonetimi/yetki/model/yetki_model.dart';
import '../../core/auth/cache_manager.dart';
import '../../core/model/response_model.dart';

abstract class IYetkiService {
  final String _path = "api/Yetki";
  Future<ResponseModel> getYetki(RolListeModel model);
  Future<ResponseModel> addYetki(YetkiModel model);
  Future<ResponseModel> updateYetki(YetkiModel model);
  Future<ResponseModel> yetkiEkle(RolListeModel model);
}

class YetkiService extends IYetkiService
    with HttpNetworkNManager, CacheManager {
  @override
  Future<ResponseModel> addYetki(YetkiModel model) async =>
      await httpPost(model, '$_path/AddYetki', await getToken());

  @override
  Future<ResponseModel> updateYetki(YetkiModel model) async =>
      await httpPut(model, '$_path/UpdateYetki', await getToken());
  @override
  Future<ResponseModel> yetkiEkle(RolListeModel model) async =>
      await httpPost(model, '$_path/YetkiEkle', await getToken());
  @override
  Future<ResponseModel> getYetki(RolListeModel model) async {
    final response = await httpPost(model, '$_path/GetYetki', await getToken());

    if (response.isSucced) {
      List<dynamic> body = jsonDecode(response.body);
      List<YetkiModel> filtreler =
          body.map((dynamic item) => YetkiModel.fromJson(item)).toList();
      response.body = filtreler;
    }
    return response;
  }
}
