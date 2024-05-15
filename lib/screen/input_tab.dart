import 'package:drift/drift.dart' as d;
import 'package:duckyegg/database/eggdatabase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InputTab extends ConsumerStatefulWidget {
  const InputTab({super.key});

  @override
  ConsumerState<InputTab> createState() => _InputTabState();
}

enum EggLabel {
  satu('K1', 1),
  dua('K2', 2),
  tiga('K3', 3),
  empat('K4', 4),
  lima('K5', 5),
  enam('K6', 6),
  tujuh('K7', 7),
  lapan('K8', 8);

  const EggLabel(this.label, this.val);
  final String label;
  final int val;
}

class _InputTabState extends ConsumerState<InputTab> {
  final noKandangController = TextEditingController();
  final tanggalController = TextEditingController();
  final jumlahController = TextEditingController();
  final testDropdownController = TextEditingController();

  EggLabel? selectedDropDown;

  @override
  void dispose() {
    noKandangController.dispose();
    jumlahController.dispose();
    tanggalController.dispose();
    testDropdownController.dispose();
    super.dispose();
  }

  void _addEgg() async {
    if (tanggalController.text.isNotEmpty && jumlahController.text.isNotEmpty) {
      final database = ref.read(AppDatabase.provider);
      EggDabaseData? item = await database.findEgg(tanggalController.text);
      if (item == null) {
        await database.eggDabase.insertOne(EggDabaseCompanion.insert(
            tanggal: DateTime.parse(tanggalController.text),
            k1: 0,
            k2: 0,
            k3: 0,
            k4: 0,
            k5: 0,
            k6: 0,
            k7: 0,
            k8: 0,
            jumlah: 0));
      }
      EggDabaseData? items = await database.findEgg(tanggalController.text);
      final updatedVal = int.tryParse(jumlahController.text) ?? 0;
      if (items != null) {
        final jumlah = updatedVal + items.jumlah;
        switch (selectedDropDown?.val) {
          case 1:
            items = items.copyWith(k1: updatedVal, jumlah: jumlah);
            break;
          case 2:
            items = items.copyWith(k2: updatedVal, jumlah: jumlah);
            break;
          case 3:
            items = items.copyWith(k3: updatedVal, jumlah: jumlah);
            break;
          case 4:
            items = items.copyWith(k4: updatedVal, jumlah: jumlah);
            break;
          case 5:
            items = items.copyWith(k5: updatedVal, jumlah: jumlah);
            break;
          case 6:
            items = items.copyWith(k6: updatedVal, jumlah: jumlah);
            break;
          case 7:
            items = items.copyWith(k7: updatedVal, jumlah: jumlah);
            break;
          case 8:
            items = items.copyWith(k8: updatedVal, jumlah: jumlah);
            break;
          default:
        }
        await database.eggDabase.replaceOne(items);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    return Center(
      child: Form(
        key: formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              child: DropdownMenu<EggLabel>(
                controller: testDropdownController,
                leadingIcon: const Icon(Icons.egg),
                label: const Text("Kandang"),
                initialSelection: EggLabel.satu,
                onSelected: (EggLabel? egg) {
                  setState(() {
                    selectedDropDown = egg;
                  });
                },
                inputDecorationTheme: const InputDecorationTheme(
                  outlineBorder: BorderSide.none,
                ),
                expandedInsets: EdgeInsets.zero,
                dropdownMenuEntries: EggLabel.values
                    .map<DropdownMenuEntry<EggLabel>>((EggLabel egg) {
                  return DropdownMenuEntry<EggLabel>(
                      value: egg, label: egg.label);
                }).toList(),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            SizedBox(
              width: 200,
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: jumlahController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.egg),
                  hintText: "Jumlah",
                  labelText: "Egg Count ",
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            SizedBox(
              width: 200,
              child: TextFormField(
                controller: tanggalController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.calendar_today),
                  labelText: "Input Date",
                ),
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (pickedDate != null) {
                    String formmatedDate = pickedDate.toString();
                    setState(() {
                      tanggalController.text = formmatedDate;
                    });
                  }
                },
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
              onPressed: () {
                formkey.currentState?.reset();

                _addEgg();
                DefaultTabController.of(context).animateTo(1);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[600],
              ),
              child: const Text("Submit"),
            ),
            Text(selectedDropDown?.val.toString() ?? "")
          ],
        ),
      ),
    );
  }
}
