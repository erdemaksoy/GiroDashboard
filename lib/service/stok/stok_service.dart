import 'dart:convert';


import '../../../core/network/http_network_manager.dart';
import '../../_stok/en_cok_satan/model/en_cok_satan_model.dart';
import '../../_stok/gimsa_satis/model/gimsa_satis_model.dart';
import '../../_stok/stok_hareket/model/stok_hareket_model.dart';
import '../../_stok/stok_request_model.dart';
import '../../core/auth/cache_manager.dart';
import '../../core/model/response_model.dart';

abstract class IStokService {
  final String _path = "api/Stok";

  Future<ResponseModel> getStokGimsa(StokRequestModel model);
  Future<ResponseModel> getStokHareket(StokRequestModel model);
  Future<ResponseModel> getStokEnCokSatan(StokRequestModel model);
}

class StokService extends IStokService with HttpNetworkNManager, CacheManager {
  @override
  Future<ResponseModel> getStokEnCokSatan(StokRequestModel model) async {
    final response = await httpPost(
        model, '$_path/EnCokSatanUrunler', await getToken() as String?);
    if (response.isSucced) {
      List<dynamic> body = jsonDecode(response.body);
      List<EnCokSatanModel> models =
          body.map((dynamic item) => EnCokSatanModel.fromJson(item)).toList();
      response.body = models;
      return response;
    } else {
      throw Exception('Failed to load en çok satan model');
    }
  }

  @override
  Future<ResponseModel> getStokGimsa(StokRequestModel model) async {
    final response =
        await httpPost(model, '$_path/Gimsa', await getToken() as String?);
    if (response.isSucced) {
      List<dynamic> body = jsonDecode(response.body);
      List<GimsaSatisModel> models =
          body.map((dynamic item) => GimsaSatisModel.fromJson(item)).toList();
      response.body = models;
      return response;
    } else {
      throw Exception('Failed to load gimsa satis');
    }
  }

  @override
  Future<ResponseModel> getStokHareket(StokRequestModel model) async {
    final response = await httpPost(
        model, '$_path/StokHareket', await getToken() as String?);
    if (response.isSucced) {
      List<dynamic> body = jsonDecode(response.body);
      List<StokHareketModel> models =
          body.map((dynamic item) => StokHareketModel.fromJson(item)).toList();
      response.body = models;
      return response;
    } else {
      throw Exception('Failed to load stok hareket');
    }
  }
}
