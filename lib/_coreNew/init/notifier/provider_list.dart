
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../../core/auth/auth_manager.dart';
import '../navigation/navigation_service.dart';
import 'theme_notifier.dart';

class ApplicationProvider {
  static ApplicationProvider? _instance;

  static ApplicationProvider get instance {
    _instance ??= ApplicationProvider._init();
    return _instance!;
  }

  ApplicationProvider._init();

  List<SingleChildWidget> singleItems = [];
  List<SingleChildWidget> dependItems = [
    ChangeNotifierProvider(create: (context) => ThemeNotifier()),
    ChangeNotifierProvider(
        create: (context) => AuthenticationManager(context: context)),
    Provider.value(value: NavigationService.instance)
  ];
  List<SingleChildWidget> uiChangesItems = [];
}
