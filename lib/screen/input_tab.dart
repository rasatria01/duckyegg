import 'package:duckyegg/models/egg.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class InputTab extends StatefulWidget {
  const InputTab({super.key});

  @override
  State<InputTab> createState() => _InputTabState();
}

class _InputTabState extends State<InputTab> {
  final noKandangController = TextEditingController();
  final tanggalController = TextEditingController();
  final jumlahController = TextEditingController();

  @override
  void dispose() {
    noKandangController.dispose();
    jumlahController.dispose();
    tanggalController.dispose();
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
              child: TextFormField(
                controller: noKandangController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  icon: Icon(Icons.numbers),
                  hintText: "1-8",
                  labelText: "No Kandang",
                ),
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
                Item data = Item(
                  id: egg.getId(),
                  tanggal: tanggalController.text,
                  noKandang: int.tryParse(noKandangController.text) ?? 0,
                  jumlah: int.tryParse(jumlahController.text) ?? 0,
                );
                egg.add(data);
                formkey.currentState?.reset();

                DefaultTabController.of(context).animateTo(1);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[600],
              ),
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
