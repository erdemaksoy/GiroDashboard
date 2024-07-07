import 'dart:convert';


import '../../../core/network/http_network_manager.dart';
import '../../_satis/saatlik_satis/model/saatlik_satis_model.dart';
import '../../_satis/satis_request_model.dart';
import '../../_satis/urun_satis/model/urun_satis_model.dart';
import '../../core/auth/cache_manager.dart';
import '../../core/model/response_model.dart';

abstract class ISatisService {
  final String _path = "api/Satis";

  Future<ResponseModel> getSaatlikSatis(SatisRequestModel model);
  Future<ResponseModel> getSatisUrun(SatisRequestModel model);
  Future<ResponseModel> getSatisOdeme(SatisRequestModel model);
}

class SatisService extends ISatisService
    with HttpNetworkNManager, CacheManager {
  @override
  Future<ResponseModel> getSaatlikSatis(SatisRequestModel model) async {
    final response = await httpPost(
        model, '$_path/SaatlikSatis', await getToken() as String?);
    if (response.isSucced) {
      List<dynamic> body = jsonDecode(response.body);
      List<SaatlikSatisModel> satis =
          body.map((dynamic item) => SaatlikSatisModel.fromJson(item)).toList();
      response.body = satis;
      return response;
    } else {
      throw Exception('Failed to load kasiyer performans');
    }
  }

  @override
  Future<ResponseModel> getSatisOdeme(SatisRequestModel model) async =>
      httpPost(model, '$_path/SatisOdeme', await getToken() as String?);

  @override
  Future<ResponseModel> getSatisUrun(SatisRequestModel model) async {
    final response =
        await httpPost(model, '$_path/SatisUrun', await getToken() as String?);
    if (response.isSucced) {
      List<dynamic> body = jsonDecode(response.body);
      List<UrunSatisModel> satis =
          body.map((dynamic item) => UrunSatisModel.fromJson(item)).toList();
      response.body = satis;
    }
    return response;
  }
}
