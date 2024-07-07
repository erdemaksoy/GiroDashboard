import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:girodashboard/core/extension/color_extension.dart';

import '../../model/dashboard_model.dart';

class PieChartWithLabel extends StatefulWidget {
  final String label;
  final Color color;
  final DashboardModel dash;
  const PieChartWithLabel(this.label, this.color, this.dash, {Key? key})
      : super(key: key);

  @override
  State<PieChartWithLabel> createState() => _PieChartWithLabelState();
}

class _PieChartWithLabelState extends State<PieChartWithLabel> {
  int touchedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => _showPieChartDetails(context, widget.dash),
        child: buildCard());
  }

  // üzerine tıklanıdığında detay değer gösterme
  void _showPieChartDetails(BuildContext context, DashboardModel model) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('${widget.label}'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                ListBody(
                  children: <Widget>[buildCard()],
                ),
                Text('Değer: ${model.value}'),
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

  List<PieChartSectionData> showingSections(DashboardModel dash) {
    Color? randomC;
    return List.generate(2, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 40.0 : 30.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: randomC.toRandomColor, //randomC.toRandomColor,
            value: dash.value,
            title: "${dash.value}",
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: randomC.toRandomColor,
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: randomC.toRandomColor,
            value: 1,
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: randomC.toRandomColor,
              shadows: shadows,
            ),
          );
        default:
          return PieChartSectionData(
            color: randomC.toRandomColor,
            value: 0,
            title: "0",
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: randomC.toRandomColor,
              shadows: shadows,
            ),
          );
      }
    });
  }

  Widget buildCard() => Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2.0),
      ),
      child: AspectRatio(
        aspectRatio: 1,
        child: Row(
          children: <Widget>[
            Expanded(
              child: AspectRatio(
                aspectRatio: 1.3,
                child: PieChart(
                  PieChartData(
                    pieTouchData: PieTouchData(
                      touchCallback: (FlTouchEvent event, pieTouchResponse) {
                        setState(() {
                          if (!event.isInterestedForInteractions ||
                              pieTouchResponse == null ||
                              pieTouchResponse.touchedSection == null) {
                            touchedIndex = -1;
                            return;
                          }
                          touchedIndex = pieTouchResponse
                              .touchedSection!.touchedSectionIndex;
                        });
                      },
                    ),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    sectionsSpace: 0,
                    centerSpaceRadius: 40,
                    sections: showingSections(widget.dash),
                  ),
                ),
              ),
            ),
          ],
        ),
      ));
}
