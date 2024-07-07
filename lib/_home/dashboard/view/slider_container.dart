import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../_coreNew/base/view/base_widget.dart';
import '../../../_coreNew/components/charts/pie_chart.dart';
import '../../../_coreNew/extension/context_extension.dart';
import '../viewmodel/dashboard_view_model.dart';

class SliderContainer extends StatelessWidget {
  SliderContainer({super.key, required this.pages});
  final List<Chart> pages;

  @override
  Widget build(BuildContext context) {
    return BaseView<DashboardViewModel>(
      viewModel: DashboardViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, DashboardViewModel value) =>
          _buildStack(context, value),
    );
  }

  Stack _buildStack(BuildContext context, DashboardViewModel viewModel) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: context.width > 650 ? context.height : context.height,
          child: Observer(builder: (_) {
            return PageView.builder(
              controller: viewModel.pageController,
              itemCount: pages.length,
              onPageChanged: viewModel.updadteAcitvePage,
              itemBuilder: (context, index) {
                return Container(child: pages[index]);
              },
            );
          }),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Container(
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(
                viewModel.pages.length,
                (index) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: InkWell(
                    onTap: () {
                      viewModel.pageController.animateToPage(index,
                          duration: Duration(milliseconds: 250),
                          curve: Curves.easeIn);
                    },
                    child: Observer(builder: (_) {
                      return CircleAvatar(
                        radius: 4,
                        backgroundColor: viewModel.activePage == index
                            ? context.colors.onSurface
                            : Colors.grey,
                      );
                    }),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
