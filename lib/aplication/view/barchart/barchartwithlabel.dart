import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:girodashboard/core/extension/color_extension.dart';

import '../../model/dashboard_model.dart';

class MyBarChart extends StatefulWidget {
  MyBarChart({Key? key, required this.dashs, required this.id})
      : super(key: key);
  List<DashboardModel> dashs;
  final String id;
  @override
  State<MyBarChart> createState() => _MyBarChartState();
}

class _MyBarChartState extends State<MyBarChart> {
  Color? randomC;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => _showBarChartDetails(context), child: buildCardBarChart());
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.bold,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'FETIH';
        break;
      case 1:
        text = 'BOSNA';
        break;
      case 2:
        text = 'STADYUM';
        break;
      case 3:
        text = 'ADAKALE';
        break;
      case 4:
        text = 'AHMET OZCAN';
        break;
      case 5:
        text = 'GODENE';
        break;
      case 6:
        text = 'YAZIR';
        break;
      case 7:
        text = 'KERKÜK';
        break;
      case 8:
        text = 'CECNISTAN';
        break;
      default:
        text = '';
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Transform.rotate(
          angle: -0.8,
          child: Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(text, style: style))),
    );
  }

  Widget buildCardBarChart() => Container(
        // padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.all(5.0),
        child: Card(
          color: Color(int.parse('0xFFF6F5F5')),
          child: AspectRatio(
            aspectRatio: 1,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  gridData: const FlGridData(
                      show: true,
                      drawHorizontalLine: true,
                      drawVerticalLine: false),
                  borderData: FlBorderData(
                    show: true,
                    border: Border(
                      bottom: BorderSide(
                          color: Colors.white.withOpacity(0.2), width: 4),
                      left: const BorderSide(color: Colors.transparent),
                      right: const BorderSide(color: Colors.transparent),
                      top: const BorderSide(color: Colors.transparent),
                    ),
                  ),
                  barGroups: barsGrups(widget.dashs),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: bottomTitles,
                        reservedSize: 50,
                      ),
                    ),
                    topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false)),
                    rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false)),
                  ),
                ),
              ),
            ),
          ),
        ),
      );

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    Color? barColor,
    double width = 20,
    List<int> showTooltips = const [],
  }) {
    barColor ??= randomC.toRandomColor;
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          fromY: 0,
          toY: isTouched ? y + 1 : y,
          color: barColor,
          width: width,
          borderSide: const BorderSide(color: Colors.white, width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 20,
            color: Colors.white,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> barsGrups(List<DashboardModel> models) {
    List<BarChartGroupData> model = [];
    for (int i = 0; i < models.length; i++) {
      model.add(makeGroupData(
        width: 10,
        i,
        widget.dashs[i].value ?? 0,
        barColor: randomC.toRandomColor,
      ));
    }
    return model;
  }

  // Üzerine tıklanıldığında detay değer gösterme
  void _showBarChartDetails(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('${widget.id}'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Yıllık Ciro'),
                ...widget.dashs
                    .map((group) => Text('${group.label}: ${group.value}')),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Kapat'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

int calc_ranks(ranks) {
  double multiplier = .5;
  return (multiplier * ranks).round();
}
