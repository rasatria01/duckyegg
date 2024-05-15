// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eggdatabase.dart';

// ignore_for_file: type=lint
class $EggDabaseTable extends EggDabase
    with TableInfo<$EggDabaseTable, EggDabaseData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EggDabaseTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _tanggalMeta =
      const VerificationMeta('tanggal');
  @override
  late final GeneratedColumn<DateTime> tanggal = GeneratedColumn<DateTime>(
      'tanggal', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _k1Meta = const VerificationMeta('k1');
  @override
  late final GeneratedColumn<int> k1 = GeneratedColumn<int>(
      'k1', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _k2Meta = const VerificationMeta('k2');
  @override
  late final GeneratedColumn<int> k2 = GeneratedColumn<int>(
      'k2', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _k3Meta = const VerificationMeta('k3');
  @override
  late final GeneratedColumn<int> k3 = GeneratedColumn<int>(
      'k3', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _k4Meta = const VerificationMeta('k4');
  @override
  late final GeneratedColumn<int> k4 = GeneratedColumn<int>(
      'k4', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _k5Meta = const VerificationMeta('k5');
  @override
  late final GeneratedColumn<int> k5 = GeneratedColumn<int>(
      'k5', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _k6Meta = const VerificationMeta('k6');
  @override
  late final GeneratedColumn<int> k6 = GeneratedColumn<int>(
      'k6', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _k7Meta = const VerificationMeta('k7');
  @override
  late final GeneratedColumn<int> k7 = GeneratedColumn<int>(
      'k7', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _k8Meta = const VerificationMeta('k8');
  @override
  late final GeneratedColumn<int> k8 = GeneratedColumn<int>(
      'k8', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _jumlahMeta = const VerificationMeta('jumlah');
  @override
  late final GeneratedColumn<int> jumlah = GeneratedColumn<int>(
      'jumlah', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, tanggal, k1, k2, k3, k4, k5, k6, k7, k8, jumlah];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'egg_dabase';
  @override
  VerificationContext validateIntegrity(Insertable<EggDabaseData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('tanggal')) {
      context.handle(_tanggalMeta,
          tanggal.isAcceptableOrUnknown(data['tanggal']!, _tanggalMeta));
    } else if (isInserting) {
      context.missing(_tanggalMeta);
    }
    if (data.containsKey('k1')) {
      context.handle(_k1Meta, k1.isAcceptableOrUnknown(data['k1']!, _k1Meta));
    } else if (isInserting) {
      context.missing(_k1Meta);
    }
    if (data.containsKey('k2')) {
      context.handle(_k2Meta, k2.isAcceptableOrUnknown(data['k2']!, _k2Meta));
    } else if (isInserting) {
      context.missing(_k2Meta);
    }
    if (data.containsKey('k3')) {
      context.handle(_k3Meta, k3.isAcceptableOrUnknown(data['k3']!, _k3Meta));
    } else if (isInserting) {
      context.missing(_k3Meta);
    }
    if (data.containsKey('k4')) {
      context.handle(_k4Meta, k4.isAcceptableOrUnknown(data['k4']!, _k4Meta));
    } else if (isInserting) {
      context.missing(_k4Meta);
    }
    if (data.containsKey('k5')) {
      context.handle(_k5Meta, k5.isAcceptableOrUnknown(data['k5']!, _k5Meta));
    } else if (isInserting) {
      context.missing(_k5Meta);
    }
    if (data.containsKey('k6')) {
      context.handle(_k6Meta, k6.isAcceptableOrUnknown(data['k6']!, _k6Meta));
    } else if (isInserting) {
      context.missing(_k6Meta);
    }
    if (data.containsKey('k7')) {
      context.handle(_k7Meta, k7.isAcceptableOrUnknown(data['k7']!, _k7Meta));
    } else if (isInserting) {
      context.missing(_k7Meta);
    }
    if (data.containsKey('k8')) {
      context.handle(_k8Meta, k8.isAcceptableOrUnknown(data['k8']!, _k8Meta));
    } else if (isInserting) {
      context.missing(_k8Meta);
    }
    if (data.containsKey('jumlah')) {
      context.handle(_jumlahMeta,
          jumlah.isAcceptableOrUnknown(data['jumlah']!, _jumlahMeta));
    } else if (isInserting) {
      context.missing(_jumlahMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EggDabaseData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EggDabaseData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      tanggal: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}tanggal'])!,
      k1: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}k1'])!,
      k2: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}k2'])!,
      k3: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}k3'])!,
      k4: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}k4'])!,
      k5: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}k5'])!,
      k6: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}k6'])!,
      k7: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}k7'])!,
      k8: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}k8'])!,
      jumlah: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}jumlah'])!,
    );
  }

  @override
  $EggDabaseTable createAlias(String alias) {
    return $EggDabaseTable(attachedDatabase, alias);
  }
}

class EggDabaseData extends DataClass implements Insertable<EggDabaseData> {
  final int id;
  final DateTime tanggal;
  final int k1;
  final int k2;
  final int k3;
  final int k4;
  final int k5;
  final int k6;
  final int k7;
  final int k8;
  final int jumlah;
  const EggDabaseData(
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
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['tanggal'] = Variable<DateTime>(tanggal);
    map['k1'] = Variable<int>(k1);
    map['k2'] = Variable<int>(k2);
    map['k3'] = Variable<int>(k3);
    map['k4'] = Variable<int>(k4);
    map['k5'] = Variable<int>(k5);
    map['k6'] = Variable<int>(k6);
    map['k7'] = Variable<int>(k7);
    map['k8'] = Variable<int>(k8);
    map['jumlah'] = Variable<int>(jumlah);
    return map;
  }

  EggDabaseCompanion toCompanion(bool nullToAbsent) {
    return EggDabaseCompanion(
      id: Value(id),
      tanggal: Value(tanggal),
      k1: Value(k1),
      k2: Value(k2),
      k3: Value(k3),
      k4: Value(k4),
      k5: Value(k5),
      k6: Value(k6),
      k7: Value(k7),
      k8: Value(k8),
      jumlah: Value(jumlah),
    );
  }

  factory EggDabaseData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EggDabaseData(
      id: serializer.fromJson<int>(json['id']),
      tanggal: serializer.fromJson<DateTime>(json['tanggal']),
      k1: serializer.fromJson<int>(json['k1']),
      k2: serializer.fromJson<int>(json['k2']),
      k3: serializer.fromJson<int>(json['k3']),
      k4: serializer.fromJson<int>(json['k4']),
      k5: serializer.fromJson<int>(json['k5']),
      k6: serializer.fromJson<int>(json['k6']),
      k7: serializer.fromJson<int>(json['k7']),
      k8: serializer.fromJson<int>(json['k8']),
      jumlah: serializer.fromJson<int>(json['jumlah']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'tanggal': serializer.toJson<DateTime>(tanggal),
      'k1': serializer.toJson<int>(k1),
      'k2': serializer.toJson<int>(k2),
      'k3': serializer.toJson<int>(k3),
      'k4': serializer.toJson<int>(k4),
      'k5': serializer.toJson<int>(k5),
      'k6': serializer.toJson<int>(k6),
      'k7': serializer.toJson<int>(k7),
      'k8': serializer.toJson<int>(k8),
      'jumlah': serializer.toJson<int>(jumlah),
    };
  }

  EggDabaseData copyWith(
          {int? id,
          DateTime? tanggal,
          int? k1,
          int? k2,
          int? k3,
          int? k4,
          int? k5,
          int? k6,
          int? k7,
          int? k8,
          int? jumlah}) =>
      EggDabaseData(
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
        jumlah: jumlah ?? this.jumlah,
      );
  @override
  String toString() {
    return (StringBuffer('EggDabaseData(')
          ..write('id: $id, ')
          ..write('tanggal: $tanggal, ')
          ..write('k1: $k1, ')
          ..write('k2: $k2, ')
          ..write('k3: $k3, ')
          ..write('k4: $k4, ')
          ..write('k5: $k5, ')
          ..write('k6: $k6, ')
          ..write('k7: $k7, ')
          ..write('k8: $k8, ')
          ..write('jumlah: $jumlah')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, tanggal, k1, k2, k3, k4, k5, k6, k7, k8, jumlah);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EggDabaseData &&
          other.id == this.id &&
          other.tanggal == this.tanggal &&
          other.k1 == this.k1 &&
          other.k2 == this.k2 &&
          other.k3 == this.k3 &&
          other.k4 == this.k4 &&
          other.k5 == this.k5 &&
          other.k6 == this.k6 &&
          other.k7 == this.k7 &&
          other.k8 == this.k8 &&
          other.jumlah == this.jumlah);
}

class EggDabaseCompanion extends UpdateCompanion<EggDabaseData> {
  final Value<int> id;
  final Value<DateTime> tanggal;
  final Value<int> k1;
  final Value<int> k2;
  final Value<int> k3;
  final Value<int> k4;
  final Value<int> k5;
  final Value<int> k6;
  final Value<int> k7;
  final Value<int> k8;
  final Value<int> jumlah;
  const EggDabaseCompanion({
    this.id = const Value.absent(),
    this.tanggal = const Value.absent(),
    this.k1 = const Value.absent(),
    this.k2 = const Value.absent(),
    this.k3 = const Value.absent(),
    this.k4 = const Value.absent(),
    this.k5 = const Value.absent(),
    this.k6 = const Value.absent(),
    this.k7 = const Value.absent(),
    this.k8 = const Value.absent(),
    this.jumlah = const Value.absent(),
  });
  EggDabaseCompanion.insert({
    this.id = const Value.absent(),
    required DateTime tanggal,
    required int k1,
    required int k2,
    required int k3,
    required int k4,
    required int k5,
    required int k6,
    required int k7,
    required int k8,
    required int jumlah,
  })  : tanggal = Value(tanggal),
        k1 = Value(k1),
        k2 = Value(k2),
        k3 = Value(k3),
        k4 = Value(k4),
        k5 = Value(k5),
        k6 = Value(k6),
        k7 = Value(k7),
        k8 = Value(k8),
        jumlah = Value(jumlah);
  static Insertable<EggDabaseData> custom({
    Expression<int>? id,
    Expression<DateTime>? tanggal,
    Expression<int>? k1,
    Expression<int>? k2,
    Expression<int>? k3,
    Expression<int>? k4,
    Expression<int>? k5,
    Expression<int>? k6,
    Expression<int>? k7,
    Expression<int>? k8,
    Expression<int>? jumlah,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (tanggal != null) 'tanggal': tanggal,
      if (k1 != null) 'k1': k1,
      if (k2 != null) 'k2': k2,
      if (k3 != null) 'k3': k3,
      if (k4 != null) 'k4': k4,
      if (k5 != null) 'k5': k5,
      if (k6 != null) 'k6': k6,
      if (k7 != null) 'k7': k7,
      if (k8 != null) 'k8': k8,
      if (jumlah != null) 'jumlah': jumlah,
    });
  }

  EggDabaseCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? tanggal,
      Value<int>? k1,
      Value<int>? k2,
      Value<int>? k3,
      Value<int>? k4,
      Value<int>? k5,
      Value<int>? k6,
      Value<int>? k7,
      Value<int>? k8,
      Value<int>? jumlah}) {
    return EggDabaseCompanion(
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
      jumlah: jumlah ?? this.jumlah,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (tanggal.present) {
      map['tanggal'] = Variable<DateTime>(tanggal.value);
    }
    if (k1.present) {
      map['k1'] = Variable<int>(k1.value);
    }
    if (k2.present) {
      map['k2'] = Variable<int>(k2.value);
    }
    if (k3.present) {
      map['k3'] = Variable<int>(k3.value);
    }
    if (k4.present) {
      map['k4'] = Variable<int>(k4.value);
    }
    if (k5.present) {
      map['k5'] = Variable<int>(k5.value);
    }
    if (k6.present) {
      map['k6'] = Variable<int>(k6.value);
    }
    if (k7.present) {
      map['k7'] = Variable<int>(k7.value);
    }
    if (k8.present) {
      map['k8'] = Variable<int>(k8.value);
    }
    if (jumlah.present) {
      map['jumlah'] = Variable<int>(jumlah.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EggDabaseCompanion(')
          ..write('id: $id, ')
          ..write('tanggal: $tanggal, ')
          ..write('k1: $k1, ')
          ..write('k2: $k2, ')
          ..write('k3: $k3, ')
          ..write('k4: $k4, ')
          ..write('k5: $k5, ')
          ..write('k6: $k6, ')
          ..write('k7: $k7, ')
          ..write('k8: $k8, ')
          ..write('jumlah: $jumlah')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  _$AppDatabaseManager get managers => _$AppDatabaseManager(this);
  late final $EggDabaseTable eggDabase = $EggDabaseTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [eggDabase];
  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}

typedef $$EggDabaseTableInsertCompanionBuilder = EggDabaseCompanion Function({
  Value<int> id,
  required DateTime tanggal,
  required int k1,
  required int k2,
  required int k3,
  required int k4,
  required int k5,
  required int k6,
  required int k7,
  required int k8,
  required int jumlah,
});
typedef $$EggDabaseTableUpdateCompanionBuilder = EggDabaseCompanion Function({
  Value<int> id,
  Value<DateTime> tanggal,
  Value<int> k1,
  Value<int> k2,
  Value<int> k3,
  Value<int> k4,
  Value<int> k5,
  Value<int> k6,
  Value<int> k7,
  Value<int> k8,
  Value<int> jumlah,
});

class $$EggDabaseTableTableManager extends RootTableManager<
    _$AppDatabase,
    $EggDabaseTable,
    EggDabaseData,
    $$EggDabaseTableFilterComposer,
    $$EggDabaseTableOrderingComposer,
    $$EggDabaseTableProcessedTableManager,
    $$EggDabaseTableInsertCompanionBuilder,
    $$EggDabaseTableUpdateCompanionBuilder> {
  $$EggDabaseTableTableManager(_$AppDatabase db, $EggDabaseTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$EggDabaseTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$EggDabaseTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$EggDabaseTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> tanggal = const Value.absent(),
            Value<int> k1 = const Value.absent(),
            Value<int> k2 = const Value.absent(),
            Value<int> k3 = const Value.absent(),
            Value<int> k4 = const Value.absent(),
            Value<int> k5 = const Value.absent(),
            Value<int> k6 = const Value.absent(),
            Value<int> k7 = const Value.absent(),
            Value<int> k8 = const Value.absent(),
            Value<int> jumlah = const Value.absent(),
          }) =>
              EggDabaseCompanion(
            id: id,
            tanggal: tanggal,
            k1: k1,
            k2: k2,
            k3: k3,
            k4: k4,
            k5: k5,
            k6: k6,
            k7: k7,
            k8: k8,
            jumlah: jumlah,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required DateTime tanggal,
            required int k1,
            required int k2,
            required int k3,
            required int k4,
            required int k5,
            required int k6,
            required int k7,
            required int k8,
            required int jumlah,
          }) =>
              EggDabaseCompanion.insert(
            id: id,
            tanggal: tanggal,
            k1: k1,
            k2: k2,
            k3: k3,
            k4: k4,
            k5: k5,
            k6: k6,
            k7: k7,
            k8: k8,
            jumlah: jumlah,
          ),
        ));
}

class $$EggDabaseTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $EggDabaseTable,
    EggDabaseData,
    $$EggDabaseTableFilterComposer,
    $$EggDabaseTableOrderingComposer,
    $$EggDabaseTableProcessedTableManager,
    $$EggDabaseTableInsertCompanionBuilder,
    $$EggDabaseTableUpdateCompanionBuilder> {
  $$EggDabaseTableProcessedTableManager(super.$state);
}

class $$EggDabaseTableFilterComposer
    extends FilterComposer<_$AppDatabase, $EggDabaseTable> {
  $$EggDabaseTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get tanggal => $state.composableBuilder(
      column: $state.table.tanggal,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get k1 => $state.composableBuilder(
      column: $state.table.k1,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get k2 => $state.composableBuilder(
      column: $state.table.k2,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get k3 => $state.composableBuilder(
      column: $state.table.k3,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get k4 => $state.composableBuilder(
      column: $state.table.k4,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get k5 => $state.composableBuilder(
      column: $state.table.k5,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get k6 => $state.composableBuilder(
      column: $state.table.k6,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get k7 => $state.composableBuilder(
      column: $state.table.k7,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get k8 => $state.composableBuilder(
      column: $state.table.k8,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get jumlah => $state.composableBuilder(
      column: $state.table.jumlah,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$EggDabaseTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $EggDabaseTable> {
  $$EggDabaseTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get tanggal => $state.composableBuilder(
      column: $state.table.tanggal,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get k1 => $state.composableBuilder(
      column: $state.table.k1,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get k2 => $state.composableBuilder(
      column: $state.table.k2,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get k3 => $state.composableBuilder(
      column: $state.table.k3,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get k4 => $state.composableBuilder(
      column: $state.table.k4,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get k5 => $state.composableBuilder(
      column: $state.table.k5,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get k6 => $state.composableBuilder(
      column: $state.table.k6,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get k7 => $state.composableBuilder(
      column: $state.table.k7,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get k8 => $state.composableBuilder(
      column: $state.table.k8,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get jumlah => $state.composableBuilder(
      column: $state.table.jumlah,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class _$AppDatabaseManager {
  final _$AppDatabase _db;
  _$AppDatabaseManager(this._db);
  $$EggDabaseTableTableManager get eggDabase =>
      $$EggDabaseTableTableManager(_db, _db.eggDabase);
}
