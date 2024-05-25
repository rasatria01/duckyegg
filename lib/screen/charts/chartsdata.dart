import 'package:duckyegg/database/eggdatabase.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class ChartData extends StatelessWidget {
  final List<EggDabaseData> dta;
  const ChartData({required this.dta, required this.showingDaata, super.key});
  final bool showingDaata;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: showingDaata ? choiceKandang : choiceJumlah,
        ),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
              width: dta.length * 80,
              child: LineChart(
                sampleData1,
                duration: const Duration(milliseconds: 250),
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<bool> get generatedIsNotEmptyEggCol {
    List<bool> res = [];
    res.add(dta.every((element) => element.k1 != 0));
    res.add(dta.every((element) => element.k2 != 0));
    res.add(dta.every((element) => element.k3 != 0));
    res.add(dta.every((element) => element.k4 != 0));
    res.add(dta.every((element) => element.k5 != 0));
    res.add(dta.every((element) => element.k6 != 0));
    res.add(dta.every((element) => element.k7 != 0));
    res.add(dta.every((element) => element.k8 != 0));

    return res;
  }

  List<List<int>> get generateListValue {
    List<List<int>> res = [];
    res.add(dta.map((e) => e.k1).toList());
    res.add(dta.map((e) => e.k2).toList());
    res.add(dta.map((e) => e.k3).toList());
    res.add(dta.map((e) => e.k4).toList());
    res.add(dta.map((e) => e.k5).toList());
    res.add(dta.map((e) => e.k6).toList());
    res.add(dta.map((e) => e.k7).toList());
    res.add(dta.map((e) => e.k8).toList());

    return res;
  }

  LineChartData get sampleData1 => LineChartData(
        lineTouchData: lineTouchData1,
        gridData: gridData,
        titlesData: titlesData1,
        borderData: borderData,
        lineBarsData: showingDaata ? lineBarsData1 : lineBarsData2,
        maxX: dta.length.toDouble(),
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
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 40,
          getTitlesWidget: (value, meta) => Positioned(
            left: 5,
            bottom: 10,
            child: defaultGetTitle(value, meta),
          ),
        ),
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
  List<Widget> get choiceJumlah {
    return [cardData(Colors.cyan, "Sum")];
  }

  Widget cardData(Color color, String text) {
    return Card(
      color: Colors.blueGrey.withOpacity(0.5),
      child: SizedBox(
        width: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 12,
              height: 12,
              color: color,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(text)
          ],
        ),
      ),
    );
  }

  List<Widget> get choiceKandang {
    return [
      cardData(Colors.cyan, "K1"),
      cardData(Colors.yellow, "K2"),
      cardData(Colors.red, "K3"),
      cardData(Colors.green, "K4"),
      cardData(Colors.white, "K5"),
      cardData(Colors.purple, "K6"),
    ];
  }
}
