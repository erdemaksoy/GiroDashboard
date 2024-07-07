import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:girodashboard/core/extension/color_extension.dart';

import '../../model/dashboard_model.dart';

class MyPieChart extends StatefulWidget {
  MyPieChart({super.key, this.dashs, required this.id});
  late List<DashboardModel>? dashs;
  final String id;
  @override
  State<StatefulWidget> createState() => MyPieChartState();
}

class MyPieChartState extends State<MyPieChart> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => _showPieChartDetails(context), child: _abuildCard());
  }

  Widget _abuildCard() {
    return Card(
        color: Color.fromARGB(255, 251, 251, 251),
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
                      sections: showingSections(widget.dashs),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  void _showPieChartDetails(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('${widget.id}'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                ListBody(
                  children: <Widget>[_abuildCard()],
                ),
                widget.dashs != null
                    ? widget.dashs!.length == 2
                        ? Column(children: [
                            Text(
                                '${widget.dashs![0].label} : ${widget.dashs![0].value}'),
                            Text(
                                '${widget.dashs![1].label} : ${widget.dashs![1].value}')
                          ])
                        : Text(
                            '${widget.dashs![0].label} : ${widget.dashs![0].value}')
                    : Text("Değer yok")
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

  List<PieChartSectionData> showingSections(List<DashboardModel>? dashs) {
    Color? randomC;
    return List.generate(dashs != null ? dashs.length : 1, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      return dashs != null
          ? switchSecim(i, randomC, radius, fontSize, shadows, dashs)
          : pieSectionMethod(Colors.red, radius, fontSize, shadows, 0);
    });
  }

  PieChartSectionData switchSecim(int i, Color? randomC, double radius,
      double fontSize, List<Shadow> shadows, List<DashboardModel> dashs) {
    if (dashs.length == 1) {
      switch (i) {
        case 0:
          return pieSectionMethod(
              Colors.blue.shade800, radius, fontSize, shadows, dashs[0].value!);
        default:
          return pieSectionMethod(
              Colors.blue.shade800, radius, fontSize, shadows, 0);
      }
    } else if (dashs.length == 2) {
      switch (i) {
        case 0:
          return pieSectionMethod(
              Colors.red, radius, fontSize, shadows, dashs[0].value!);
        case 1:
          return pieSectionMethod(
              Colors.orange, radius, fontSize, shadows, dashs[1].value!);
        default:
          return pieSectionMethod(
              randomC.toRandomColor, radius, fontSize, shadows, 0);
      }
    } else {
      return pieSectionMethod(
          randomC.toRandomColor, radius, fontSize, shadows, 0);
    }
  }

  PieChartSectionData pieSectionMethod(Color? randomC, double radius,
      double fontSize, List<Shadow> shadows, double value) {
    return PieChartSectionData(
      color: randomC,
      value: value,
      title: formatAndConvert(value),
      radius: radius,
      titleStyle: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
        shadows: shadows,
      ),
    );
  }
}

String formatAndConvert(double value) {
  String formattedValue;

  if (value >= 1000000000) {
    formattedValue = "${(value / 1000000000).toStringAsFixed(1)}milyar";
  } else if (value >= 1000000) {
    formattedValue = "${(value / 1000000).toStringAsFixed(1)}m";
  } else if (value >= 1000) {
    formattedValue = "${(value / 1000).toStringAsFixed(1)}b";
  } else {
    formattedValue = value.toString();
  }

  // Remove the suffix and convert back to double
  String numberPart = formattedValue.substring(0, formattedValue.length - 1);
  String suffix = formattedValue.substring(formattedValue.length - 1);
  return numberPart + suffix;
}
