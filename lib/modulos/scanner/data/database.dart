import 'dart:ffi';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

@DataClassName('Leitura')
class Leituras extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get dado => text()();
  DateTimeColumn get createAt =>
      dateTime().withDefault(currentDateAndTime).nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@UseMoor(tables: [Leituras])
class Database extends _$Database {
  Database() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<void> createOrUpdateLeitura(Leitura item) async {
    final it = await into(leituras).insertOnConflictUpdate(item);
    return Future.value(item.id);
  }

  Future remover(int id) {
    return (delete(leituras)..where((t) => t.id.equals(id))).go();
  }

  Stream<List<Leitura>> streamLeituras() {
    return (select(leituras)
          ..orderBy([
            (u) =>
                OrderingTerm(expression: u.createAt, mode: OrderingMode.desc),
          ]))
        .watch();
  }
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'scanner.sqlite'));
    return VmDatabase(file);
  });
}
