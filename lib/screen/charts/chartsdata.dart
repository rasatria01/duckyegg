import 'package:duckyegg/database/eggdatabase.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChartData extends StatelessWidget {
  final List<EggDabaseData> dta;
  const ChartData({required this.dta, required this.showingDaata, super.key});
  final bool showingDaata;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
        width: 800,
        child: LineChart(
          sampleData1,
          duration: const Duration(milliseconds: 250),
        ),
      ),
    );
  }

  LineChartData get sampleData1 => LineChartData(
        lineTouchData: lineTouchData1,
        gridData: gridData,
        titlesData: titlesData1,
        borderData: borderData,
        lineBarsData: showingDaata ? lineBarsData1 : lineBarsData2,
        maxX: dta.first.tanggal.day.toDouble(),
      );

  FlGridData get gridData => const FlGridData(show: true, verticalInterval: 1);

  List<LineChartBarData> get lineBarsData1 => [
        linechart(Colors.white, dta.map((e) => e.k5).toList()),
        linechart(Colors.cyan, dta.map((e) => e.k1).toList()),
        linechart(Colors.yellow, dta.map((e) => e.k2).toList()),
        linechart(Colors.red, dta.map((e) => e.k3).toList()),
        linechart(Colors.green, dta.map((e) => e.k4).toList()),
        linechart(Colors.purple, dta.map((e) => e.k6).toList()),
      ];

  List<LineChartBarData> get lineBarsData2 => [
        linechart(Colors.cyan, dta.map((e) => e.jumlah).toList()),
      ];

  LineChartBarData linechart(Color color, List<int> data) {
    return LineChartBarData(
        preventCurveOverShooting: true,
        barWidth: 4,
        isCurved: true,
        color: color,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: List.generate(data.length,
            (index) => FlSpot(index.toDouble(), data[index].toDouble())));
  }

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: const Border(
          bottom: BorderSide(color: Colors.blueAccent),
          left: BorderSide(color: Colors.transparent),
          right: BorderSide(color: Colors.transparent),
          top: BorderSide(color: Colors.transparent),
        ),
      );

  LineTouchData get lineTouchData1 => LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          getTooltipColor: (touchedSpot) => Colors.blueGrey.withOpacity(0.8),
          fitInsideHorizontally: true,
          fitInsideVertically: true,
        ),
      );

  FlTitlesData get titlesData1 => FlTitlesData(
      show: true,
      bottomTitles: AxisTitles(
        sideTitles: bottomTitles,
      ),
      rightTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: const AxisTitles(
        sideTitles: SideTitles(
          showTitles: false,
        ),
      ),
      leftTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: true, reservedSize: 40),
      ));

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    if (value.toInt() >= dta.length || value.toInt() < 0) {
      text = const Text("");
    } else {
      text = Text(
        DateFormat("dd/MM").format(dta[value.toInt()].tanggal),
        style: style,
      );
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 32,
        interval: 1,
        getTitlesWidget: bottomTitleWidgets,
      );
}
