import 'package:duckyegg/database/eggdatabase.dart';
import 'package:duckyegg/screen/charts/chartsdata.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeTab extends ConsumerStatefulWidget {
  const HomeTab({super.key});

  @override
  ConsumerState<HomeTab> createState() => _HomeTabState();
}

enum Choice {
  satu('Chart PerKandang', 1),
  dua('Chart Jumlah', 2);

  const Choice(this.label, this.val);
  final String label;
  final int val;
}

class _HomeTabState extends ConsumerState<HomeTab> {
  final _dropDownController = TextEditingController();
  Choice? _selectedChoice = Choice.satu;

  final eggStream = StreamProvider((ref) {
    final database = ref.watch(AppDatabase.provider);

    return database.watchAllEgg();
  });

  @override
  @override
  Widget build(BuildContext context) {
    final currentEgg = ref.watch(eggStream);
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: DropdownMenu<Choice>(
              controller: _dropDownController,
              label: const Text("Select View"),
              initialSelection: Choice.satu,
              onSelected: (Choice? choice) {
                setState(() {
                  _selectedChoice = choice;
                });
              },
              expandedInsets: EdgeInsets.zero,
              dropdownMenuEntries:
                  Choice.values.map<DropdownMenuEntry<Choice>>((Choice c) {
                return DropdownMenuEntry<Choice>(value: c, label: c.label);
              }).toList(),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: _selectedChoice?.val == 1 ? choiceKandang : choiceJumlah,
          ),
          Expanded(
            child: currentEgg.when(
              data: (newEgg) {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: ChartData(
                    dta: newEgg,
                    showingDaata: _selectedChoice?.val == 1 ? true : false,
                  ),
                );
              },
              error: ((error, stackTrace) {
                debugPrintStack(
                    label: error.toString(), stackTrace: stackTrace);
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
              ),
            ),
          ),
        ],
      ),
    );
  }

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
