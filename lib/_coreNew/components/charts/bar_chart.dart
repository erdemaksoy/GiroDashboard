import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyBarChart extends StatelessWidget {
  const MyBarChart({super.key});

  @override
  Widget build(BuildContext context) {
       List<BarChartModel> item = myBarCharts;
    return BarChart(
      BarChartData(
        borderData: FlBorderData(
          border: Border.all(width: 0)
        ),
        groupsSpace: 15,
        titlesData:  FlTitlesData(
              show: true,
              leftTitles: AxisTitles(
                drawBelowEverything: true,
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 30,
                  getTitlesWidget: (value, meta) {
                    return Text(
                      value.toInt().toString(),
                      textAlign: TextAlign.left,
                    );
                  },
                ),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 36,
                  getTitlesWidget: (value, meta) {
                   
                    return SideTitleWidget(
                      axisSide: meta.axisSide,
                      child: item.singleWhere((e) => e.xValue == value).child
                    );
                  },
                ),
              ),
              rightTitles: const AxisTitles(),
              topTitles: const AxisTitles(),
            ), 
        barGroups: item.map((e) => generateBarGroup(e)).toList(),
    )
   );
  }
}
  BarChartGroupData generateBarGroup(BarChartModel model) {
    return BarChartGroupData(
      x: model.xValue,
      barRods: [
        BarChartRodData(
          toY: model.yValue,
          color: model.color,
          width: 30,
        ),
       
      ],
      //showingTooltipIndicators: touchedGroupIndex == model.xValue ? [0] : [],
    );
  }
class BarChartModel {
final int xValue;
final double yValue;
final Color color;
final Widget child;
final double shadowValue;
BarChartModel(this.xValue, this.yValue, this.color, this.child, this.shadowValue);
}

List<BarChartModel> myBarCharts = [
 BarChartModel(9, 43, Colors.amber, Text("1.değer"),200),

 BarChartModel(11, 241, Colors.amber, Text("2.değer"),200),
 
 BarChartModel(12, 21, Colors.amber, Text("3.değer"),200),
 
 BarChartModel(1, 204, Colors.amber, Text("4.değer"),200),
  
 BarChartModel(2, 204, Colors.amber, Text("4.değer"),200),
  
 BarChartModel(143, 204, Colors.amber, Text("4.değer"),200),
  
 BarChartModel(144, 204, Colors.amber, Text("4.değer"),200),
  
 BarChartModel(145, 204, Colors.amber, Text("4.değer"),200),
  
 BarChartModel(146, 204, Colors.amber, Text("4.değer"),200),
  
 BarChartModel(147, 204, Colors.amber, Text("4.değer"),200),
  
 BarChartModel(148, 204, Colors.amber, Text("4.değer"),200),
  
 BarChartModel(14, 204, Colors.amber, Text("4.değer"),200),
];