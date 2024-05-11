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
        leftHandSideColumnWidth: 70,
        rightHandSideColumnWidth: 400,
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
            width: 70,
            height: 40,
            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
            alignment: Alignment.centerLeft,
            child: Text(egg.items[index].id.toString()),
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
                child: Text(egg.items[index].tanggal.toString()),
              ),
              Container(
                width: 100,
                height: 40,
                padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                alignment: Alignment.centerLeft,
                child: Text(egg.items[index].noKandang.toString()),
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
      _getTitleItemWidget("No", 70),
      _getTitleItemWidget("Tanggal", 100),
      _getTitleItemWidget("No Kandang", 100),
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
