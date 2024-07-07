import 'package:shared_preferences/shared_preferences.dart';

mixin CacheManager {
  Future<bool> saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(CacheManagerKey.TOKEN.toString(), token);
    return true;
  }

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(CacheManagerKey.TOKEN.toString());
  }

  Future<List<String>> getPieChartList(String userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> pieChartLabel =
        prefs.getStringList(CacheManagerKey.CHART.toString() + userId) ?? [];
    return pieChartLabel;
  }

  Future<void> addPieChartItem(String userId, List<String> newItem) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(CacheManagerKey.CHART.toString() + userId);
    await prefs.setStringList(
        CacheManagerKey.CHART.toString() + userId, newItem);
  }
}

enum CacheManagerKey { TOKEN, CHART }
