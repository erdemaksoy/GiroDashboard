import 'package:mobx/mobx.dart';

import '../../../../aplication/model/dashboard_model.dart';

part 'chart_store.g.dart';

class ChartStore = _ChartStoreBase with _$ChartStore;

abstract class _ChartStoreBase with Store {
  @observable
  List<DashboardModel?> models = [];

  @observable
  int touchedIndex = -1;

  @action
  void setTouchedIndex(int index) {
    touchedIndex = index;
  }

  @action
  void setModels(List<DashboardModel?> newModels) {
    models = newModels;
  }
}
