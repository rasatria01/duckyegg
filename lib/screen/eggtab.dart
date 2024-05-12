import 'package:duckyegg/models/egg.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:provider/provider.dart';

class EggTab extends StatelessWidget {
  const EggTab({super.key});

  @override
  Widget build(BuildContext context) {
    var egg = context.watch<EggTable>();
    return Container(
      padding: const EdgeInsets.all(12),
      child: HorizontalDataTable(
        leftHandSideColumnWidth: 100,
        rightHandSideColumnWidth: 900,
        isFixedHeader: true,
        headerWidgets: _getHeaderWidget(),
        itemCount: egg.getLen(),
        rowSeparatorWidget: const Divider(
          color: Colors.white70,
          height: 1.0,
          thickness: 0.0,
        ),
        leftSideItemBuilder: (context, index) {
          return Container(
            width: 100,
            height: 40,
            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
            alignment: Alignment.centerLeft,
            child: Text(egg.items[index].tanggal.toString()),
          );
        },
        rightSideItemBuilder: (context, index) {
          return Row(
            children: [
              Container(
                width: 100,
                height: 40,
                padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                alignment: Alignment.centerLeft,
                child: Text(egg.items[index].k1.toString()),
              ),
              Container(
                width: 100,
                height: 40,
                padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                alignment: Alignment.centerLeft,
                child: Text(egg.items[index].k2.toString()),
              ),
              Container(
                width: 100,
                height: 40,
                padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                alignment: Alignment.centerLeft,
                child: Text(egg.items[index].k3.toString()),
              ),
              Container(
                width: 100,
                height: 40,
                padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                alignment: Alignment.centerLeft,
                child: Text(egg.items[index].k4.toString()),
              ),
              Container(
                width: 100,
                height: 40,
                padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                alignment: Alignment.centerLeft,
                child: Text(egg.items[index].k5.toString()),
              ),
              Container(
                width: 100,
                height: 40,
                padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                alignment: Alignment.centerLeft,
                child: Text(egg.items[index].k6.toString()),
              ),
              Container(
                width: 100,
                height: 40,
                padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                alignment: Alignment.centerLeft,
                child: Text(egg.items[index].k7.toString()),
              ),
              Container(
                width: 100,
                height: 40,
                padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                alignment: Alignment.centerLeft,
                child: Text(egg.items[index].k8.toString()),
              ),
              Container(
                width: 100,
                height: 40,
                padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                alignment: Alignment.centerLeft,
                child: Text(egg.items[index].jumlah.toString()),
              ),
            ],
          );
        },
        leftHandSideColBackgroundColor: Colors.grey[900]!,
        rightHandSideColBackgroundColor:
            Theme.of(context).colorScheme.background,
      ),
    );
  }

  List<Widget> _getHeaderWidget() {
    return [
      _getTitleItemWidget("Tanggal", 100),
      _getTitleItemWidget("K1", 100),
      _getTitleItemWidget("K2", 100),
      _getTitleItemWidget("K3", 100),
      _getTitleItemWidget("K4", 100),
      _getTitleItemWidget("K5", 100),
      _getTitleItemWidget("K6", 100),
      _getTitleItemWidget("K7", 100),
      _getTitleItemWidget("K8", 100),
      _getTitleItemWidget("Jumlah", 70),
    ];
  }

  Widget _getTitleItemWidget(String label, double width) {
    return Container(
      width: width,
      height: 56,
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
      child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}
