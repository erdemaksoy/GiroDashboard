import '../../../../core/network/http_network_manager.dart';
import '../../../_auth/login/model/login_model.dart';
import '../../core/auth/cache_manager.dart';
import '../../core/model/response_model.dart';

abstract class IAuthService {
  final String _path = 'api/Auth';
  Future<ResponseModel> login(LoginModel model);
  Future<ResponseModel> logout();
}

class AuthService extends IAuthService with HttpNetworkNManager, CacheManager {
  @override
  Future<ResponseModel> login(LoginModel model) async =>
      await httpPost(model, '$_path/login', await getToken() as String?);

  @override
  Future<ResponseModel> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}
