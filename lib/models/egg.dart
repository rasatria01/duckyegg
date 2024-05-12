import 'package:flutter/material.dart';

class Item {
  final int id;
  final String tanggal;
  final int jumlah;
  final int k1;
  final int k2;
  final int k3;
  final int k4;
  final int k5;
  final int k6;
  final int k7;
  final int k8;

  const Item(
      {required this.id,
      required this.tanggal,
      required this.k1,
      required this.k2,
      required this.k3,
      required this.k4,
      required this.k5,
      required this.k6,
      required this.k7,
      required this.k8,
      required this.jumlah});

  Item copyWith({
    int? id,
    String? tanggal,
    int? jumlah,
    int? k1,
    int? k2,
    int? k3,
    int? k4,
    int? k5,
    int? k6,
    int? k7,
    int? k8,
  }) {
    int sum = (k1 ?? this.k1) +
        (k2 ?? this.k2) +
        (k3 ?? this.k3) +
        (k4 ?? this.k4) +
        (k5 ?? this.k5) +
        (k6 ?? this.k6) +
        (k7 ?? this.k7) +
        (k8 ?? this.k8);
    return Item(
        id: id ?? this.id,
        tanggal: tanggal ?? this.tanggal,
        k1: k1 ?? this.k1,
        k2: k2 ?? this.k2,
        k3: k3 ?? this.k3,
        k4: k4 ?? this.k4,
        k5: k5 ?? this.k5,
        k6: k6 ?? this.k6,
        k7: k7 ?? this.k7,
        k8: k8 ?? this.k8,
        jumlah: sum);
  }

  Item updateWith({
    required int id,
    required String tanggal,
    required int nokan,
    required int juml,
  }) {
    switch (nokan) {
      case 1:
        return copyWith(id: id, tanggal: tanggal, k1: juml);
      case 2:
        return copyWith(id: id, tanggal: tanggal, k2: juml);
      case 3:
        return copyWith(id: id, tanggal: tanggal, k3: juml);
      case 4:
        return copyWith(id: id, tanggal: tanggal, k4: juml);
      case 5:
        return copyWith(id: id, tanggal: tanggal, k5: juml);
      case 6:
        return copyWith(id: id, tanggal: tanggal, k6: juml);
      case 7:
        return copyWith(id: id, tanggal: tanggal, k7: juml);
      case 8:
        return copyWith(id: id, tanggal: tanggal, k8: juml);
      default:
        return copyWith(id: id, tanggal: tanggal);
    }
  }

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

  bool checkTanggal(String tanggal) {
    for (var element in _eggItems) {
      if (element.tanggal == tanggal) {
        return true;
      }
    }
    return false;
  }

  Item ambilByTanggal(String tanggal) {
    for (var element in _eggItems) {
      if (element.tanggal == tanggal) {
        return element;
      }
    }
    return createItem(id: getId(), tanggal: tanggal);
  }
}

Item createItem({required int id, required String tanggal}) {
  return Item(
    id: id,
    tanggal: tanggal,
    k1: 0,
    k2: 0,
    k3: 0,
    k4: 0,
    k5: 0,
    k6: 0,
    k7: 0,
    k8: 0,
    jumlah: 0,
  );
}
