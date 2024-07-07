import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../_coreNew/base/view/base_widget.dart';
import '../../../_coreNew/components/card/analytic_card.dart';
import '../../../_coreNew/components/card/analytic_info_card.dart';
import '../../../_coreNew/components/charts/pie_chart.dart';
import '../../../_coreNew/extension/context_extension.dart';
import '../viewmodel/dashboard_view_model.dart';
import 'accordion_page.dart';
import 'slider_container.dart';

class DashboardContent extends StatelessWidget {
  const DashboardContent({super.key});
  @override
  Widget build(BuildContext context) {
    return BaseView<DashboardViewModel>(
      viewModel: DashboardViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, DashboardViewModel value) =>
          _buildSafeArea(context, value),
    );
  }

  Scaffold _buildSafeArea(BuildContext context, DashboardViewModel viewModel) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                width: double.infinity,
                height: 400,
                color: context.colors.background,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 300,
                      child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        initialDateTime: DateTime.now(),
                        minimumDate: DateTime(2000),
                        maximumDate: DateTime(2101),
                        onDateTimeChanged: viewModel.updateDateTime,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      width: 100,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          //print(viewModel.tarih.toString());

                          viewModel.getWidget();
                          viewModel.getAnaltyicWidget();
                        },
                        child: const Text("Tamam"),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        backgroundColor: context.colors.onSecondary,
        child: const Icon(
          Icons.calendar_month,
          size: 35,
          color: Colors.red,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              AspectRatio(
                  aspectRatio: context.width > 650 ? 2 : 1.2,
                  child: Observer(builder: (_) {
                    return viewModel.pages.isEmpty
                        ? Center(child: CircularProgressIndicator())
                        : SliderContainer(
                            pages: [
                              Chart(
                                models: viewModel.pages[0].models,
                                title: DashboardChartType.values[0].stringValue,
                              ),
                              Chart(
                                models: viewModel.pages[1].models,
                                title: DashboardChartType.values[1].stringValue,
                              ),
                              Chart(
                                models: viewModel.pages[2].models,
                                title: DashboardChartType.values[2].stringValue,
                              ),
                              Chart(
                                models: viewModel.pages[3].models,
                                title: DashboardChartType.values[3].stringValue,
                              ),
                            ],
                          );
                  })),
              const SizedBox(
                height: 16,
              ),
              Observer(builder: (_) {
                return viewModel.items.isEmpty
                    ? AnalyticCards(item: [
                        AnalyticInfoCard(
                            icon: FontAwesomeIcons.users,
                            title: DashboardItemType.values[0].stringValue,
                            infoText: "0"),
                        AnalyticInfoCard(
                            icon: FontAwesomeIcons.basketShopping,
                            title: DashboardItemType.values[1].stringValue,
                            infoText: "0"),
                        AnalyticInfoCard(
                            icon: FontAwesomeIcons.rotateLeft,
                            title: DashboardItemType.values[2].stringValue,
                            infoText: "0"),
                        AnalyticInfoCard(
                            icon: FontAwesomeIcons.chartSimple,
                            title: DashboardItemType.values[3].stringValue,
                            infoText: "0"),
                        AnalyticInfoCard(
                            icon: FontAwesomeIcons.chartColumn,
                            title: DashboardItemType.values[4].stringValue,
                            infoText: "0"),
                        AnalyticInfoCard(
                            icon: FontAwesomeIcons.calculator,
                            title: DashboardItemType.values[5].stringValue,
                            infoText: "0"),
                      ])
                    : AnalyticCards(item: [
                        AnalyticInfoCard(
                            icon: FontAwesomeIcons.users,
                            title: DashboardItemType.values[0].stringValue,
                            infoText: "${(viewModel.items[0].value)?.round()}"),
                        AnalyticInfoCard(
                            icon: FontAwesomeIcons.basketShopping,
                            title: DashboardItemType.values[1].stringValue,
                            infoText: "${(viewModel.items[1].value)?.round()}"),
                        AnalyticInfoCard(
                            icon: FontAwesomeIcons.rotateLeft,
                            title: DashboardItemType.values[2].stringValue,
                            infoText: "${(viewModel.items[2].value)?.round()}"),
                        AnalyticInfoCard(
                            icon: FontAwesomeIcons.chartSimple,
                            title: DashboardItemType.values[3].stringValue,
                            infoText: "${(viewModel.items[3].value)?.round()}"),
                        AnalyticInfoCard(
                            icon: FontAwesomeIcons.chartColumn,
                            title: DashboardItemType.values[4].stringValue,
                            infoText: "${(viewModel.items[4].value)?.round()}"),
                        AnalyticInfoCard(
                            icon: FontAwesomeIcons.calculator,
                            title: DashboardItemType.values[5].stringValue,
                            infoText: "${(viewModel.items[5].value)?.round()}"),
                      ]);
              }),
              //ViewLineChart(),
              AccordionPage(),
            ],
          ),
        ),
      ),
    );
  }
}
