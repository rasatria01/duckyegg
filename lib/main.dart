import 'package:duckyegg/models/egg.dart';
import 'package:duckyegg/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<EggTable>(
          create: (context) => EggTable(),
        ),
      ],
      child: MaterialApp(
        title: "DuckEgg",
        theme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.dark,
            colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.lightBlueAccent,
                brightness: Brightness.dark)),
        home: const HomePage(),
      ),
    );
  }
}