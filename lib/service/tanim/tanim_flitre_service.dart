import 'dart:convert';

import '../../../core/network/http_network_manager.dart';
import '../../_tanim/rapor_filtre_tanim/model/rapor_filtre_tanim_model.dart';
import '../../core/auth/cache_manager.dart';
import '../../core/model/response_model.dart';

abstract class ITanimFlitreService {
  final String _path = "api/RaporFiltre";
  Future<ResponseModel> getRaporFiltre(String raporKodu);
  Future<ResponseModel> addRaporFiltre(RaporFiltreTanimModel model);
  Future<ResponseModel> editRaporFiltre(RaporFiltreTanimModel model);
  Future<ResponseModel> deleteRaporFiltre(RaporFiltreTanimModel model);
}

class TanimFiltreService extends ITanimFlitreService
    with HttpNetworkNManager, CacheManager {
  @override
  Future<ResponseModel> getRaporFiltre(String raporKodu) async {
    final response = await httpGetParametre(
        '$_path/GetRaporFiltre', await getToken() as String?, raporKodu);

    if (response.isSucced) {
      List<dynamic> body = jsonDecode(response.body);
      List<RaporFiltreTanimModel> filtreler = body
          .map((dynamic item) => RaporFiltreTanimModel.fromJson(item))
          .toList();
      response.body = filtreler;
    }
    return response;
  }

  @override
  Future<ResponseModel> addRaporFiltre(RaporFiltreTanimModel model) async =>
      await httpPost(
          model, '$_path/AddRaporFiltre', await getToken() as String?);

  @override
  Future<ResponseModel> editRaporFiltre(RaporFiltreTanimModel model) async =>
      await httpPost(
          model, '$_path/EditRaporFiltre', await getToken() as String?);

  @override
  Future<ResponseModel> deleteRaporFiltre(RaporFiltreTanimModel model) async =>
      await httpPost(model, '$_path/Delete', await getToken() as String?);
}
