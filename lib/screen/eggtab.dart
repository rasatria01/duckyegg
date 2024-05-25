import 'package:duckyegg/database/eggdatabase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:intl/intl.dart';

class EggView extends ConsumerStatefulWidget {
  const EggView({super.key});

  @override
  ConsumerState<EggView> createState() => _EggViewState();
}

class _EggViewState extends ConsumerState<EggView> {
  final eggStream = StreamProvider((ref) {
    final database = ref.watch(AppDatabase.provider);

    return database.watchAllEgg();
  });

  @override
  Widget build(BuildContext context) {
    final currentEgg = ref.watch(eggStream);
    return Container(
        padding: const EdgeInsets.all(12),
        child: currentEgg.when(
            data: (eggItems) {
              return HorizontalDataTable(
                leftHandSideColumnWidth: 100,
                rightHandSideColumnWidth: 900,
                isFixedHeader: true,
                headerWidgets: _getHeaderWidget(),
                itemCount: eggItems.length,
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
                    child: Text(DateFormat("dd/MM/yyyy")
                        .format(eggItems[index].tanggal)),
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
                        child: Text(eggItems[index].k1.toString()),
                      ),
                      Container(
                        width: 100,
                        height: 40,
                        padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                        alignment: Alignment.centerLeft,
                        child: Text(eggItems[index].k2.toString()),
                      ),
                      Container(
                        width: 100,
                        height: 40,
                        padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                        alignment: Alignment.centerLeft,
                        child: Text(eggItems[index].k3.toString()),
                      ),
                      Container(
                        width: 100,
                        height: 40,
                        padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                        alignment: Alignment.centerLeft,
                        child: Text(eggItems[index].k4.toString()),
                      ),
                      Container(
                        width: 100,
                        height: 40,
                        padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                        alignment: Alignment.centerLeft,
                        child: Text(eggItems[index].k5.toString()),
                      ),
                      Container(
                        width: 100,
                        height: 40,
                        padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                        alignment: Alignment.centerLeft,
                        child: Text(eggItems[index].k6.toString()),
                      ),
                      Container(
                        width: 100,
                        height: 40,
                        padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                        alignment: Alignment.centerLeft,
                        child: Text(eggItems[index].k7.toString()),
                      ),
                      Container(
                        width: 100,
                        height: 40,
                        padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                        alignment: Alignment.centerLeft,
                        child: Text(eggItems[index].k8.toString()),
                      ),
                      Container(
                        width: 100,
                        height: 40,
                        padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                        alignment: Alignment.centerLeft,
                        child: Text(eggItems[index].jumlah.toString()),
                      ),
                    ],
                  );
                },
                leftHandSideColBackgroundColor: Colors.grey[900]!,
                rightHandSideColBackgroundColor:
                    Theme.of(context).colorScheme.background,
              );
            },
            error: ((error, stackTrace) {
              debugPrintStack(label: error.toString(), stackTrace: stackTrace);
              return Column(
                children: [
                  const Text("an error occured"),
                  Text(error.toString()),
                ],
              );
            }),
            loading: () => const Align(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                )));
  }

  List<Widget> _getHeaderWidget() {
    return [
      _getTitleItemWidget("Date", 100),
      _getTitleItemWidget("K1", 100),
      _getTitleItemWidget("K2", 100),
      _getTitleItemWidget("K3", 100),
      _getTitleItemWidget("K4", 100),
      _getTitleItemWidget("K5", 100),
      _getTitleItemWidget("K6", 100),
      _getTitleItemWidget("K7", 100),
      _getTitleItemWidget("K8", 100),
      _getTitleItemWidget("Sum", 70),
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
