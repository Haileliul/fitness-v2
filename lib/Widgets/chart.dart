import 'package:fl_chart/fl_chart.dart';

import 'package:flutter/material.dart';

class LineChartWidget extends StatelessWidget {
  final List<Color> gradientColors = [
    const Color.fromARGB(255, 53, 57, 56),
    const Color.fromARGB(255, 230, 35, 35),
  ];

  LineChartWidget({super.key});

  @override
  Widget build(BuildContext context) => LineChart(
        LineChartData(
          minX: 0,
          maxX: 30,
          minY: 0,
          maxY: 40,
          // titlesData: LineTitles.getTitleData(),

          titlesData: FlTitlesData(
            show: true,
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1,
                getTitlesWidget: (value, meta) {
                  switch (value.toInt()) {
                    case 0:
                      return const Text('Week one');
                    case 10:
                      return const Text('Week Two');
                    case 20:
                      return const Text('Week Three');
                    case 30:
                      return const Text('Week Four');
                  }
                  return const Text(" ");
                },
              ),
            ),
            topTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
              ),
            ),
          ),

          gridData: FlGridData(
            show: true,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: const Color(0xff37434d),
                strokeWidth: 1,
              );
            },
            drawVerticalLine: false,
            getDrawingVerticalLine: (value) {
              return FlLine(
                color: const Color(0xff37434d),
                strokeWidth: 1,
              );
            },
          ),
          borderData: FlBorderData(
            show: true,
            border: Border.all(
                color: const Color.fromRGBO(55, 67, 77, 1), width: 1),

            // border: Border.fromBorderSide(BorderSide())
          ),
          lineBarsData: [
            LineChartBarData(
              spots: [
                const FlSpot(0, 0),
                const FlSpot(5, 18),
                const FlSpot(10, 19),
                const FlSpot(13, 23),
                const FlSpot(14, 14),
                const FlSpot(16, 29),
                const FlSpot(18, 38),
                const FlSpot(29, 27),
              ],
              isCurved: true,
              // gradient: LinearGradient(colors: gradientColors),
              color: Colors.grey,

              barWidth: 2,
              // dotData: FlDotData(show: false),

              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: gradientColors
                      .map((color) => color.withOpacity(0.5))
                      .toList(),
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ],
        ),
      );
}
