import 'package:duckyegg/screen/eggtab.dart';
import 'package:duckyegg/screen/input_tab.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.home),
                text: 'Home',
              ),
              Tab(
                icon: Icon(Icons.egg),
                text: 'Egg',
              ),
              Tab(
                icon: Icon(Icons.input),
                text: 'Input',
              )
            ],
          ),
          title: const Text("Ducky GO"),
        ),
        body: const TabBarView(
          children: [
            Placeholder(
              color: Colors.blue,
            ),
            EggTab(),
            InputTab(),
          ],
        ),
      ),
    );
  }
}
