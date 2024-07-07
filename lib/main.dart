import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '_coreNew/init/notifier/provider_list.dart';
import '_coreNew/init/notifier/theme_notifier.dart';
import '_home/dashboard/viewmodel/dashboard_view_model.dart';
import 'core/components/splash/splash_view.dart';

void main() => runApp(MultiProvider(
      providers: [
        ...ApplicationProvider.instance.dependItems,
        Provider<DashboardViewModel>(create: (_) => DashboardViewModel()),
      ],
      child: const MainApp(),
    ));

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dashboard Example',
      theme: context.watch<ThemeNotifier>().currentTheme,
      home: SplashView(),
    );
  }
}
