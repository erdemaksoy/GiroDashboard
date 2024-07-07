import 'dart:convert';
import '../../_tanim/dashboard_tanim/model/dashboard_add_model.dart';
import '../../aplication/model/dashboard_model.dart';
import '../../aplication/model/dashboard_request_model.dart';
import '../../core/auth/cache_manager.dart';
import '../../core/model/response_model.dart';
import '../../core/network/http_network_manager.dart';

abstract class IDashboardService {
  final String _path = 'api/Dashboard';
  Future<ResponseModel> getDashboardData(DashboardRequestModel model);
  Future<ResponseModel> getDashboards();
  Future<ResponseModel> addDashboard(DashboardAddModel model);
  Future<ResponseModel> editDashboard(DashboardAddModel model);
  Future<ResponseModel> deleteDashboard(DashboardAddModel model);
}

class DashboardService extends IDashboardService
    with HttpNetworkNManager, CacheManager {
  @override
  Future<ResponseModel> getDashboardData(DashboardRequestModel model) async {
    final response = await httpPost(
        model, '$_path/GetDashboardData', await getToken() as String?);

    if (response.isSucced) {
      final List<dynamic> body = jsonDecode(response.body);
      //print(body);
      List<DashboardModel> charts = body
          .map((json) => DashboardModel.fromJson(json as Map<String, dynamic>))
          .toList();
      //print(charts);
      response.body = charts;
    }
    return response;
  }

  @override
  Future<ResponseModel> addDashboard(DashboardAddModel model) async =>
      await httpPost(model, '$_path/AddDashboard', await getToken());

  @override
  Future<ResponseModel> deleteDashboard(DashboardAddModel model) async =>
      await httpDelete(model, '$_path/DeleteDashboard', await getToken());

  @override
  Future<ResponseModel> editDashboard(DashboardAddModel model) async =>
      httpPut(model, '$_path/UpdateRaporGrup', await getToken());

  @override
  Future<ResponseModel> getDashboards() async {
    final response = await httpGet('$_path/GetDashboards', await getToken());

    if (response.isSucced) {
      List<dynamic> body = jsonDecode(response.body);
      List<DashboardAddModel> filtreler =
          body.map((dynamic item) => DashboardAddModel.fromJson(item)).toList();
      response.body = filtreler;
    }
    return response;
  }
}
