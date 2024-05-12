import 'package:duckyegg/models/egg.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class InputTab extends StatefulWidget {
  const InputTab({super.key});

  @override
  State<InputTab> createState() => _InputTabState();
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

class _InputTabState extends State<InputTab> {
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

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    var egg = context.watch<EggTable>();
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
                    String formmatedDate =
                        DateFormat('dd/MM/yyyy').format(pickedDate);
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
                var tanggal = tanggalController.text;
                var jumlah = int.tryParse(jumlahController.text) ?? 0;
                Item data;
                data = egg.ambilByTanggal(tanggal);

                data = data.updateWith(
                    id: data.id,
                    tanggal: tanggal,
                    nokan: selectedDropDown?.val ?? 1,
                    juml: jumlah);
                egg.remove(data);
                egg.add(data);
                formkey.currentState?.reset();

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
