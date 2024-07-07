import 'package:flutter/material.dart';

import '../../init/navigation/navigation_service.dart';
/*import '../../init/network/dio/core_dio_interface.dart';
import '../../init/network/dio/network_manager.dart';*/

abstract class BaseViewModel {
  late BuildContext viewModelContext;

  //ICoreDioNullSafety? coreDio = NetworkManager.instance!.coreDio;
  //VexanaManager vexanaManager = VexanaManager.instance;
  // LocaleManager localeManager = LocaleManager.instance;
  NavigationService navigation = NavigationService.instance;

  void setContext(BuildContext context);
  void init();
}
