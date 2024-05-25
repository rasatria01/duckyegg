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
  satu('by Pen Chart', 1),
  dua('Sum Per Day Chart', 2);

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
}
