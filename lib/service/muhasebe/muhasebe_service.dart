import 'dart:convert';



import '../../_muhasebe/kasiyer_acik/model/kasiyer_acik_model.dart';
import '../../_muhasebe/kasiyer_performans/model/kasiyer_performans_model.dart';
import '../../_muhasebe/muhasebe_request_model.dart';
import '../../core/auth/cache_manager.dart';
import '../../core/model/response_model.dart';
import '../../core/network/http_network_manager.dart';

abstract class IMuhasebeService {
  final String _path = "api/Muhasebe";

  Future<ResponseModel> getKasiyerAcik(MuhasebeRequestModel model);
  Future<ResponseModel> getKasiyerPerformans(MuhasebeRequestModel model);
}

class MuhasebeService extends IMuhasebeService
    with HttpNetworkNManager, CacheManager {
  @override
  Future<ResponseModel> getKasiyerAcik(MuhasebeRequestModel model) async {
    final response = await httpPost(
        model, '$_path/KasiyerAcik', await getToken() as String?);
    if (response.isSucced) {
      List<dynamic> body = jsonDecode(response.body);
      List<KasiyerAcikModel> kasiyer =
          body.map((dynamic item) => KasiyerAcikModel.fromJson(item)).toList();
      response.body = kasiyer;
      return response;
    } else {
      throw Exception('Failed to load kasiyer acik');
    }
  }

  @override
  Future<ResponseModel> getKasiyerPerformans(MuhasebeRequestModel model) async {
    final response = await httpPost(
        model, '$_path/KasiyerPerformans', await getToken() as String?);
    if (response.isSucced) {
      List<dynamic> body = jsonDecode(response.body);
      List<KasiyerPerformansModel> kasiyer = body
          .map((dynamic item) => KasiyerPerformansModel.fromJson(item))
          .toList();
      response.body = kasiyer;
      return response;
    } else {
      throw Exception('Failed to load kasiyer performans');
    }
  }
}
