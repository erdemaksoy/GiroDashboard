import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../_coreNew/base/model/base_view_model.dart';
import '../../../aplication/model/dashboard_model.dart';
import '../../../aplication/model/dashboard_request_model.dart';
import '../../../service/dashboard/dashboard_service.dart';

part 'dashboard_view_model.g.dart';

class DashboardViewModel = _DashboardViewModelBase with _$DashboardViewModel;

abstract class _DashboardViewModelBase extends BaseViewModel with Store {
  final IDashboardService _dashboardService = DashboardService();
  int musteriId = 1;

  @observable
  DateTime tarih = DateTime.now(); //DateTime.parse('2023-03-20T12:17:19.039Z');

  @observable
  List<DashboardModel> dashs = [];

  @observable
  List<ChartModel> pages = [];

  @observable
  List<DashboardModel> items = [];

  @observable
  PageController pageController = PageController(initialPage: 0);

  @observable
  int activePage = 0;

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  @action
  Future<void> init() async {
    //items = await getAnaltyicWidget();
    pages = await getWidget(); // Ensure widgets are initialized here
  }

  @action
  void updateDateTime(DateTime dateTime) {
    this.tarih = dateTime;
  }

  Future<List<DashboardModel>> getCharts(int raporTipi) async {
    dashs = [DashboardModel("deneme", 1)];
    final response = await _dashboardService
        .getDashboardData(DashboardRequestModel(musteriId, raporTipi, tarih));
    if (response.isSucced) {
      dashs = response.body;
    }

    return dashs;
  }

  @action
  void updadteAcitvePage(int value) {
    activePage = value;
  }

  @action
  Future<List<ChartModel>> getWidget() async {
    List<ChartModel> adddChart = [];
    for (DashboardChartType type in DashboardChartType.values) {
      List<DashboardModel> charts = await getCharts(type.intValue);
      adddChart.add(ChartModel(title: type.stringValue, models: charts));
    }
    pages = adddChart;
    return adddChart;
  }

  @action
  Future<List<DashboardModel>> getAnaltyicWidget() async {
    List<DashboardModel> models = [];
    for (DashboardItemType type in DashboardItemType.values) {
      DashboardModel item = await getItem(type.intValue, type.stringValue);
      models.add(item);
    }
    items = models;
    return models;
  }

  Future<DashboardModel> getItem(int intValue, String deneme) async {
    DashboardModel model = DashboardModel(deneme, 0);
    final response = await _dashboardService
        .getDashboardData(DashboardRequestModel(1, intValue, tarih));
    if (response.isSucced) {
      final body = response.body as List<DashboardModel>;
      model = DashboardModel(deneme, body[0].value);
    } else {
      model = DashboardModel(deneme, 0);
    }
    return model;
  }

  @observable
  bool isLigth = false;

  @action
  void getChangeTheme() {
    isLigth = !isLigth;
  }
}

enum DashboardChartType {
  OncekiGun,
  AnlikCiro,
  AnlikOdemeler,
  BelgeDagilim,
}

extension DashboardCharTypeExtension on DashboardChartType {
  String get stringValue {
    switch (this) {
      case DashboardChartType.OncekiGun:
        return 'Önceki gün';
      case DashboardChartType.AnlikCiro:
        return 'Anlık Ciro';
      case DashboardChartType.AnlikOdemeler:
        return 'Anlık Ödemeler';
      case DashboardChartType.BelgeDagilim:
        return 'Belge Dağılım';
      default:
        return '';
    }
  }

  int get intValue {
    switch (this) {
      case DashboardChartType.OncekiGun:
        return 13;
      case DashboardChartType.AnlikCiro:
        return 4;
      case DashboardChartType.AnlikOdemeler:
        return 5;
      case DashboardChartType.BelgeDagilim:
        return 5;
      default:
        return 1;
    }
  }
}

enum DashboardItemType {
  musteriSayisi,
  sepetOrt,
  iadeToplami,
  aylikToplam,
  yillikToplam,
  gunlukOrtCiro,
}

extension DashboardItemTypeExtension on DashboardItemType {
  String get stringValue {
    switch (this) {
      case DashboardItemType.musteriSayisi:
        return 'Müşteri Sayısı';
      case DashboardItemType.sepetOrt:
        return 'Sepet Ort.';
      case DashboardItemType.iadeToplami:
        return 'İade Toplamı';
      case DashboardItemType.aylikToplam:
        return 'Aylık Toplam';
      case DashboardItemType.yillikToplam:
        return 'Yıllık Toplam';
      case DashboardItemType.gunlukOrtCiro:
        return 'Günlük Ort. Ciro';
      default:
        return '';
    }
  }

  int get intValue {
    switch (this) {
      case DashboardItemType.musteriSayisi:
        return 1;
      case DashboardItemType.sepetOrt:
        return 2;
      case DashboardItemType.iadeToplami:
        return 3;
      case DashboardItemType.aylikToplam:
        return 10;
      case DashboardItemType.yillikToplam:
        return 11;
      case DashboardItemType.gunlukOrtCiro:
        return 12;
      default:
        return 1;
    }
  }
}

class ChartModel {
  final String title;
  List<DashboardModel> models;
  ChartModel({required this.title, required this.models});
}
