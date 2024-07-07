import 'dart:convert';


import '../../../core/network/http_network_manager.dart';
import '../../_tanim/rapor_tanim/model/rapor_tanim_model.dart';
import '../../core/auth/cache_manager.dart';
import '../../core/model/response_model.dart';

abstract class ITanimService {
  final String _path = "api/Rapor";
  Future<ResponseModel> getRapor();
  Future<ResponseModel> addRapor(RaporTanimModel model);
  Future<ResponseModel> editRapor(RaporTanimModel model);
  Future<ResponseModel> deleteRapor(RaporTanimModel model);
}

class TanimService extends ITanimService
    with HttpNetworkNManager, CacheManager {
  @override
  Future<ResponseModel> addRapor(RaporTanimModel model) async =>
      await httpPost(model, '$_path/AddRapor', await getToken() as String?);

  @override
  Future<ResponseModel> deleteRapor(RaporTanimModel model) async =>
      await httpDelete(
          model, '$_path/DeleteRapor', await getToken() as String?);
  @override
  Future<ResponseModel> editRapor(RaporTanimModel model) {
    // TODO: implement editRapor
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> getRapor() async {
    final response =
        await httpGet('$_path/GetRapor', await getToken() as String?);

    if (response.isSucced) {
      List<dynamic> body = jsonDecode(response.body);
      List<RaporTanimModel> filtreler =
          body.map((dynamic item) => RaporTanimModel.fromJson(item)).toList();
      response.body = filtreler;
    }
    return response;
  }
}
