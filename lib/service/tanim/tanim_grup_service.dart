import 'dart:convert';


import '../../../core/network/http_network_manager.dart';
import '../../_tanim/rapor_grup_tanim/model/rapor_grup_tanim_model.dart';
import '../../core/auth/cache_manager.dart';
import '../../core/model/response_model.dart';

abstract class ITanimGrupService {
  final String _path = "api/RaporGrup";
  Future<ResponseModel> getRaporGrup();
  Future<ResponseModel> addRaporGrup(RaporGrupTanimModel model);
  Future<ResponseModel> editRaporGrup(RaporGrupTanimModel model);
  Future<ResponseModel> deleteRaporGrup(RaporGrupTanimModel model);
}

class TanimGrupService extends ITanimGrupService
    with HttpNetworkNManager, CacheManager {
  @override
  Future<ResponseModel> addRaporGrup(RaporGrupTanimModel model) async =>
      await httpPost(model, '$_path/AddRaporGrup', await getToken() as String?);

  @override
  Future<ResponseModel> deleteRaporGrup(RaporGrupTanimModel model) async =>
      await httpDelete(
          model, '$_path/DeleteRaporGrup', await getToken() as String?);

  @override
  Future<ResponseModel> editRaporGrup(RaporGrupTanimModel model) async =>
      httpPut(model, '$_path/UpdateRaporGrup', await getToken() as String?);

  @override
  Future<ResponseModel> getRaporGrup() async {
    final response =
        await httpGet('$_path/GetRaporGrup', await getToken() as String?);

    if (response.isSucced) {
      List<dynamic> body = jsonDecode(response.body);
      List<RaporGrupTanimModel> filtreler = body
          .map((dynamic item) => RaporGrupTanimModel.formJson(item))
          .toList();
      response.body = filtreler;
      return response;
    } else {
      return response;
    }
  }
}
