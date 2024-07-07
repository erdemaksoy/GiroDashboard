import 'dart:convert';


import '../../../core/network/http_network_manager.dart';
import '../../_tanim/rapor_kolon_tanim/model/rapor_kolon_tanim_model.dart';
import '../../core/auth/cache_manager.dart';
import '../../core/model/response_model.dart';

abstract class ITanimKolonService {
  final String _path = "api/RaporKolon";
  Future<ResponseModel> getRaporKolon(String parametre);
  Future<ResponseModel> addRaporKolon(RaporKolonModel model);
  Future<ResponseModel> editRaporKolon(RaporKolonModel model);
  Future<ResponseModel> deleteRaporKolon(RaporKolonModel model);
}

class TanimKolonService extends ITanimKolonService
    with HttpNetworkNManager, CacheManager {
  @override
  Future<ResponseModel> addRaporKolon(RaporKolonModel model) async =>
      await httpPost(
          model, '$_path/AddRaporKolon', await getToken() as String?);

  @override
  Future<ResponseModel> deleteRaporKolon(RaporKolonModel model) async =>
      await httpDelete(
          model, '$_path/DeleteRaporKolon', await getToken() as String?);

  @override
  Future<ResponseModel> editRaporKolon(RaporKolonModel model) async =>
      await httpPost(
          model, '$_path/EditRaporKolon', await getToken() as String?);

  @override
  Future<ResponseModel> getRaporKolon(String parametre) async {
    final response = await httpGetParametre(
        '$_path/GetRaporKolon', await getToken() as String?, parametre);

    if (response.isSucced) {
      List<dynamic> body = jsonDecode(response.body);
      List<RaporKolonModel> filtreler =
          body.map((dynamic item) => RaporKolonModel.fromJson(item)).toList();
      response.body = filtreler;
    }
    return response;
  }
}
