import 'package:duckyegg/database/eggdatabase.dart';
import 'package:duckyegg/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final database = AppDatabase();

  runApp(MyApp(
    databasee: database,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({required this.databasee, super.key});

  final AppDatabase databasee;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: "DuckEgg",
        theme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.dark,
            colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.lightBlueAccent,
                brightness: Brightness.dark)),
        home: HomePage(
          databasee: databasee,
        ),
      ),
    );
  }
}
