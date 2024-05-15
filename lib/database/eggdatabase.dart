import 'package:drift/drift.dart';
import 'dart:io';
import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

part "eggdatabase.g.dart";

class EggDabase extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get tanggal => dateTime()();
  IntColumn get k1 => integer()();
  IntColumn get k2 => integer()();
  IntColumn get k3 => integer()();
  IntColumn get k4 => integer()();
  IntColumn get k5 => integer()();
  IntColumn get k6 => integer()();
  IntColumn get k7 => integer()();
  IntColumn get k8 => integer()();
  IntColumn get jumlah => integer()();
}

@DriftDatabase(tables: [EggDabase])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      beforeOpen: ((details) async {
        await customStatement('PRAGMA foreign_key = ON');

        if (details.wasCreated) {
          await batch((batch) {
            batch.insertAll(eggDabase, [
              EggDabaseCompanion.insert(
                  tanggal: DateTime.parse("14/05/2024"),
                  k1: 21,
                  k2: 36,
                  k3: 54,
                  k4: 24,
                  k5: 80,
                  k6: 40,
                  k7: 0,
                  k8: 0,
                  jumlah: 255),
              EggDabaseCompanion.insert(
                  tanggal: DateTime.parse("15/05/2024"),
                  k1: 22,
                  k2: 35,
                  k3: 50,
                  k4: 24,
                  k5: 80,
                  k6: 40,
                  k7: 0,
                  k8: 0,
                  jumlah: 251),
            ]);
          });
        }
      }),
    );
  }

  Future<List<EggDabaseData>> getAllEgg() async =>
      await select(eggDabase).get();
  Stream<List<EggDabaseData>> watchAllEgg() => select(eggDabase).watch();
  Future<int> insertEgg(EggDabaseData egg) async =>
      await into(eggDabase).insert(egg);
  Future updateEgg(EggDabaseData egg) async {
    return await (update(eggDabase).replace(egg));
  }

  Future<EggDabaseData> getID(DateTime tanggal) async {
    return await (select(eggDabase)..where((t) => t.tanggal.equals(tanggal)))
        .getSingle();
  }

  Future<EggDabaseData?> findEgg(String tanggaal) {
    final DateTime tgl;
    tgl = DateTime.parse(tanggaal);
    return (select(eggDabase)..where((t) => t.tanggal.equals(tgl)))
        .getSingleOrNull();
  }

  static final StateProvider<AppDatabase> provider = StateProvider((ref) {
    final database = AppDatabase();
    ref.onDispose(() {
      database.close();
    });
    return database;
  });
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationCacheDirectory();
    final file = File(p.join(dbFolder.path, "db.sqlite"));
    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    // final cacheBase = (await getTemporaryDirectory()).path;

    return NativeDatabase.createInBackground(file);
  });
}
