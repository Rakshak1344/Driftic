import 'dart:async';

import 'package:drift/drift.dart';
import 'package:driftic/arch/logger.dart';
import 'package:driftic/arch/repository.dart';
import 'package:driftic/storage/drift/app_database.dart';
import 'package:driftic/storage/drift/app_isolate_database_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'local_point_repository.g.dart';

@riverpod
LocalPointRepository localPointRepository(
        LocalPointRepositoryRef ref, String dbName) =>
    LocalPointRepository(ref, dbName);

class LocalPointRepository extends CollectionRepository<PointEntity> {
  final LocalPointRepositoryRef ref;
  final String dbName;

  LocalPointRepository(this.ref, this.dbName);

  late final _controller = StreamController<List<PointEntity>>();
  late final _stream = _controller.stream.asBroadcastStream();
  late final Future<AppDatabase> databaseFuture =
      ref.read(appIsolateDatabaseProvider(dbName).future);

  @override
  Stream<List<PointEntity>> watch() async* {
    var db = await databaseFuture;

    db.points.select().watch().listen((List<PointEntity> event) {
      log("Event triggered");
      _controller.add(event);
    });

    await getAll().then((value) => _controller.add(value));
    yield* _stream;
  }

  @override
  Future<void> save(List<PointEntity> data) async {
    var database = await databaseFuture;
    // Inserts or updates multiple TodoItem entries in the database.
    await database.batch((batch) {
      batch.insertAllOnConflictUpdate(
        database.points,
        data.map((item) => item.toCompanion(true)).toList(),
      );
    });
  }

  // Save a single TodoItem entry in the database.
  Future<void> saveOne(PointEntity data) async {
    var database = await databaseFuture;
    await database.into(database.points).insert(
          PointsCompanion.insert(position: data.position),
        );
    log("Saved");
  }

  Future<List<PointEntity>> getAll() async {
    var database = await databaseFuture;
    return await database.points.select().get();
  }

  @override
  List<PointEntity> get() {
    // var database = await databaseFuture;
    var list = <PointEntity>[];
    // return database.points.select().getSync();
    // var todos = database.points.select().get();

    // todos.then((value) => list = value);

    return list;
  }

  @override
  Future<void> delete(PointEntity data) async {
    var database = await databaseFuture;
    // Deletes a single TodoItem entry from the database.
    await (database.points.delete()..where((tbl) => tbl.id.equals(data.id)))
        .go();
  }

  @override
  Future<void> deleteAll() async {
    var database = await databaseFuture;
    // Deletes all TodoItem entries from the database.
    await database.points.delete().go();
  }
}

// class LocalPointRepository extends CollectionRepository<PointEntity> {
//   LocalPointRepository(this.ref);
//
//   final LocalPointRepositoryRef ref;
//
//   var provider = appDatabaseProvider;
//
//   AppDatabase get database => ref.read(provider);
//
//   late final _controller = StreamController<List<PointEntity>>();
//   late final _stream = _controller.stream.asBroadcastStream();
//
//   @override
//   Stream<List<PointEntity>> watch() {
//     ref
//         .watch(provider)
//         .select(database.points)
//         .watch()
//         .listen((List<PointEntity>? event) {
//       log("Event triggered");
//       if (event != null) {
//         _controller.add(event);
//       }
//     });
//
//     getAll().then((value) => _controller.add(value));
//     return _stream;
//   }
//
//   @override
//   Future<void> save(List<PointEntity> data) async {
//     // Inserts or updates multiple TodoItem entries in the database.
//     await database.batch((batch) {
//       batch.insertAllOnConflictUpdate(
//         database.points,
//         data.map((item) => item.toCompanion(true)).toList(),
//       );
//     });
//   }
//
//   // Save a single TodoItem entry in the database.
//   Future<void> saveOne(PointEntity data) async {
//     await database.into(database.points).insert(
//           PointsCompanion.insert(position: data.position),
//         );
//     log("Saved");
//   }
//
//   Future<List<PointEntity>> getAll() async {
//     return await database.points.select().get();
//   }
//
//   @override
//   List<PointEntity> get() {
//     var list = <PointEntity>[];
//     // return database.points.select().getSync();
//     var todos = database.points.select().get();
//
//     todos.then((value) => list = value);
//
//     return list;
//   }
//
//   @override
//   Future<void> delete(PointEntity data) async {
//     // Deletes a single TodoItem entry from the database.
//     await (database.points.delete()..where((tbl) => tbl.id.equals(data.id)))
//         .go();
//   }
//
//   @override
//   Future<void> deleteAll() async {
//     // Deletes all TodoItem entries from the database.
//     await database.points.delete().go();
//   }
// }
