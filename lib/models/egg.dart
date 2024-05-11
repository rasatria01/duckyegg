import 'package:flutter/material.dart';

class Item {
  final int id;
  final String tanggal;
  final int jumlah;
  final int noKandang;

  const Item(
      {required this.id,
      required this.tanggal,
      required this.noKandang,
      required this.jumlah});

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Item && other.id == id;
}

class EggTable extends ChangeNotifier {
  var id = 0;
  final List<Item> _eggItems = [];

  void add(Item item) {
    _eggItems.add(item);
    notifyListeners();
  }

  int getId() {
    return id++;
  }

  int getLen() {
    return _eggItems.length;
  }

  List<Item> get items => _eggItems;
  void remove(Item item) {
    _eggItems.remove(item);
    notifyListeners();
  }
}
