import 'dart:async';

import 'package:drift/drift.dart';
import 'package:driftic/arch/logger.dart';
import 'package:driftic/arch/repository.dart';
import 'package:driftic/storage/drift/app_database.dart';
import 'package:driftic/storage/drift/app_in_memory_database_provider.dart';
import 'package:driftic/storage/drift/app_isolate_database_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'local_todo_item_repository.g.dart';

@riverpod
LocalTodoItemRepository localTodoItemRepository(
        LocalTodoItemRepositoryRef ref, String dbName) =>
    LocalTodoItemRepository(ref, dbName);

class LocalTodoItemRepository extends CollectionRepository<TodoItemEntity> {
  final LocalTodoItemRepositoryRef ref;
  final String dbName;

  LocalTodoItemRepository(this.ref, this.dbName);

  late final _controller = StreamController<List<TodoItemEntity>>();
  late final _stream = _controller.stream.asBroadcastStream();
  late final Future<AppDatabase> databaseFuture =
      ref.read(appInMemoryDatabaseProvider(dbName).future);

  @override
  Stream<List<TodoItemEntity>> watch() async* {
    var db = await databaseFuture;

    db.todoItems.select().watch().listen((List<TodoItemEntity> event) {
      log("Event triggered");
      _controller.add(event);
    });

    await getAll().then((value) => _controller.add(value));
    yield* _stream;
  }

  @override
  Future<void> save(List<TodoItemEntity> data) async {
    var database = await databaseFuture;
    // Inserts or updates multiple TodoItem entries in the database.
    await database.batch((batch) {
      batch.insertAllOnConflictUpdate(
        database.todoItems,
        data.map((item) => item.toCompanion(true)).toList(),
      );
    });
  }

  // Save a single TodoItem entry in the database.
  Future<void> saveOne(TodoItemEntity data) async {
    var database = await databaseFuture;
    await database.into(database.todoItems).insert(data.toCompanion(true));
    log("Saved");
  }

  Future<List<TodoItemEntity>> getAll() async {
    var database = await databaseFuture;
    return await database.todoItems.select().get();
  }

  @override
  List<TodoItemEntity> get() {
    // var database = await databaseFuture;
    var list = <TodoItemEntity>[];
    // return database.points.select().getSync();
    // var todos = database.points.select().get();

    // todos.then((value) => list = value);

    return list;
  }

  @override
  Future<void> delete(TodoItemEntity data) async {
    var database = await databaseFuture;
    // Deletes a single TodoItem entry from the database.
    await (database.todoItems.delete()..where((tbl) => tbl.id.equals(data.id)))
        .go();
  }

  @override
  Future<void> deleteAll() async {
    var database = await databaseFuture;
    // Deletes all TodoItem entries from the database.
    await database.todoItems.delete().go();
  }
}
