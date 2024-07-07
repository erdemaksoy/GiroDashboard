import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../extension/context_extension.dart';


class ViewLineChart extends StatefulWidget {
  const ViewLineChart({Key? key}) : super(key: key);

  @override
  _ViewLineChartState createState() => _ViewLineChartState();
}

class _ViewLineChartState extends State<ViewLineChart> {


  @override
  Widget build(BuildContext context) {
    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          ),
                        ],
                        border: Border.all(width: 1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      margin: const EdgeInsets.only(
                          top: 5, left: 5, right: 5, bottom: 15),
                      height: MediaQuery.of(context).size.height / 3,
                      width: MediaQuery.of(context).size.width - 20,
                      child: AspectRatio(
                        aspectRatio: 1.70,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: LineChart(
                            LineChartData(
                              gridData: FlGridData(show: false),
                              titlesData: FlTitlesData(
                                show: true,
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    reservedSize: 32,
                                    interval: 1,
                                    getTitlesWidget: (value, meta) {
                                      String title = value.toString();
        
                                      return Text(
                                        title,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      );
                                    },
                                  ),
                                ),
                                topTitles: AxisTitles(
                                    sideTitles: SideTitles(showTitles: false)),
                                rightTitles: AxisTitles(
                                    sideTitles: SideTitles(showTitles: false)),
                                leftTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    reservedSize: 30,
                                    showTitles: true,
                                    interval: 20,
                                    getTitlesWidget: (value, meta) => Text(
                                      value.toInt().toString(),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              borderData: FlBorderData(
                                show: true,
                                border:
                                    Border.all(color: Colors.black12, width: 1),
                              ),
                              maxX: (9)
                                  .toDouble(),
                              maxY: 100,
                              minY: 0,
                              lineBarsData: [
                                LineChartBarData(
                                  spots: [
                                      FlSpot(1, 32),
                                      FlSpot(2, 72),
                                      FlSpot(3, 90),
                                      FlSpot(4, 100),
                                      FlSpot(5, 51),
                                      FlSpot(6, 90),
                                      FlSpot(7, 40),
                                      FlSpot(8, 87),
                                       FlSpot(9, 90),
                                    ],
                                  isCurved: true,
                                  barWidth: 3,
                                  color: Colors.redAccent,
                                  belowBarData: BarAreaData(
                                    show: true,
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.red.withOpacity(0.3),
                                        Colors.red.withOpacity(0.1),
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
  }

}

// }
// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';

// import '../../extension/context_extension.dart';


// class ViewLineChart extends StatefulWidget {
//   const ViewLineChart({Key? key}) : super(key: key);

//   @override
//   _ViewLineChartState createState() => _ViewLineChartState();
// }

// class _ViewLineChartState extends State<ViewLineChart> {


//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: context.paddingNormal,
//       child: LineChart(LineChartData(
//           gridData: FlGridData(
//             show: false,
//           ),
//           titlesData: FlTitlesData(
//             show: true,
//             // bottomTitles: SideTitles(
//             //   showTitles: true,
//             //   reservedSize: 22,
//             //   getTextStyles: (value) => TextStyle(
//             //     color: lightTextColor,
//             //     fontWeight: FontWeight.bold,
//             //     fontSize: 14,
//             //   ),
//             //   getTitles: (value) {
//             //     switch(value.toInt()){
//             //       case 1:
//             //         return 'Sun';
//             //       case 4:
//             //         return 'Mon';
//             //       case 7:
//             //         return 'Tue';
//             //       case 10:
//             //         return 'Wed';
//             //       case 13:
//             //         return 'Thr';
//             //       case 16:
//             //         return 'Fri';
//             //       case 19:
//             //         return 'Sat';
//             //     }
//             //     return '';
//             //   }
//             // ),
//           ),
//           borderData: FlBorderData(
//             show: false,
//           ),
//           minX: 0,
//           maxX: 20,
//           maxY: 0,
//           minY: 6,
//           lineBarsData: [
//             LineChartBarData(
//                 spots: [
//                   FlSpot(0, 3),
//                   FlSpot(4, 2),
//                   FlSpot(9, 4),
//                   FlSpot(12, 3),
//                   FlSpot(15, 5),
//                   FlSpot(18, 3),
//                   FlSpot(20, 4),
//                 ],
//                 isCurved: true,
//                 color: context.randomColor,
//                 barWidth: 5,
//                 isStrokeCapRound: true,
//                 dotData: FlDotData(show: false),
//                 belowBarData: BarAreaData(
//                     show: true,
//                     color:
//                       context.randomColor.withOpacity(0.3),
//             ))
//           ])),
//     );
//   }
// }