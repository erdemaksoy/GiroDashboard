import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../_coreNew/constants/enums/app_theme_enum.dart';
import '../../../_coreNew/constants/image/image_constatns.dart';
import '../../../_coreNew/constants/lottie/lottie_constants.dart';
import '../../../_coreNew/extension/context_extension.dart';
import '../../../_coreNew/init/notifier/theme_notifier.dart';
import '../../../classNav.dart';
import '../viewmodel/dashboard_view_model.dart';
import 'dashboard_content.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  late AnimationController controller;

  void getController() {
    controller =
        AnimationController(vsync: this, duration: context.normalDuration);
  }

  final DashboardViewModel viewModel = DashboardViewModel();
  @override
  void initState() {
    super.initState();
    getController();
    controller.value = 0.5;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: context.colors.background,
        elevation: 0,
        centerTitle: true,
        title: Image.asset(
          height: 40,
          width: context.width / 3,
          ImageConstants.instance.posbacklogo,
          fit: BoxFit.fitWidth,
        ),
        actions: <Widget>[
          InkWell(
            onTap: () async {
              await controller.animateTo(viewModel.isLigth ? 0.5 : 1);
              viewModel.isLigth
                  ? context.read<ThemeNotifier>().changeValue(AppThemes.LIGHT)
                  : context.read<ThemeNotifier>().changeValue(AppThemes.DARK);
              viewModel.getChangeTheme();
            },
            child: Lottie.asset(
              controller: controller,
              width: 80,
              height: 80,
              LottieConstants.instance.themeLottie,
              fit: BoxFit.fill,
              repeat: false,
            ),
          ),
        ],
      ),
      body: DashboardContent(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}
