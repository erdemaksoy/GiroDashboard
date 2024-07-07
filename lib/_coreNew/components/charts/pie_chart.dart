import 'dart:math';

import 'package:flutter/material.dart';
import 'package:girodashboard/_coreNew/extension/context_extension.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../aplication/model/dashboard_model.dart';
import 'chartStore/chart_store.dart';

class Chart extends StatefulWidget {
  final String title;
  final List<DashboardModel?> models;
  final bool useSyncfusion;

  Chart({
    Key? key,
    required this.models,
    required this.title,
    this.useSyncfusion = true,
  }) : super(key: key);

  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  final ChartStore store = ChartStore();
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    super.initState();
    _tooltip = TooltipBehavior(enable: true);
  }

  @override
  Widget build(BuildContext context) {
    return widget.useSyncfusion ? buildSyncfusionChart() : buildFLChart();
  }

  Widget buildSyncfusionChart() {
    Random random = Random();
    final List<_ChartData> data = widget.models
        .where((model) => model != null)
        .map((model) => _ChartData(
            model!.label,
            model.value!.toDouble(),
            Color.fromRGBO(
              random.nextInt(128) + 128,
              random.nextInt(128) + 128,
              random.nextInt(128) + 128,
              1,
            ),
            widget.title))
        .toList();

    return SfCircularChart(
      title: ChartTitle(text: widget.title),
      tooltipBehavior: _tooltip,
      series: <DoughnutSeries<_ChartData, String>>[
        DoughnutSeries<_ChartData, String>(
          dataSource: data,
          xValueMapper: (_ChartData data, _) => data.x,
          yValueMapper: (_ChartData data, _) => data.y,
          pointColorMapper: (_ChartData data, _) => data.color,
          dataLabelSettings: DataLabelSettings(
            isVisible: true,
            labelPosition: ChartDataLabelPosition.outside,
            textStyle:
                TextStyle(color: context.colors.onBackground, fontSize: 14),
          ),
          enableTooltip: true,
          explode: true,
          animationDuration: 0,
          explodeGesture: ActivationMode.singleTap,
          name: widget.title,
        )
      ],
    );
  }

  Widget buildFLChart() {
    return Container();
  }
}

class _ChartData {
  _ChartData(this.x, this.y, this.color, String title);

  final String? x;
  final double y;
  final Color color;
}
