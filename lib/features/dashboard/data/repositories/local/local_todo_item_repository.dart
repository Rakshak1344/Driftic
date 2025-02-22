// import 'dart:async';
// import 'dart:convert';
//
// import 'package:driftic/arch/repository.dart';
// import 'package:driftic/storage/drift/app_database.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
//
// part 'local_todo_item_repository.g.dart';
//
// final todoItemEntityStorageProvider =
//     Provider((ref) => JsonFileStorage<List<TodoItemEntity>>());
//
// @riverpod
// LocalTodoItemRepository localTodoItemRepository(
//   LocalTodoItemRepositoryRef ref,
// ) =>
//     LocalTodoItemRepository(ref);
//
// class LocalTodoItemRepository extends CollectionRepository<TodoItemEntity> {
//   final LocalTodoItemRepositoryRef ref;
//   JsonFileStorage<List<TodoItemEntity>> storage;
//
//   LocalTodoItemRepository(this.ref)
//       : storage = ref.read(todoItemEntityStorageProvider);
//
//   @override
//   Stream<List<TodoItemEntity>> watch() {
//     return Stream.value([]);
//   }
//
//   @override
//   Future<void> delete(TodoItemEntity data) {
//     // TODO: implement delete
//     throw UnimplementedError();
//   }
//
//   @override
//   Future<void> deleteAll() {
//     // TODO: implement deleteAll
//     throw UnimplementedError();
//   }
//
//   @override
//   List<TodoItemEntity> get() {
//     // TODO: implement get
//     throw UnimplementedError();
//   }
//
//   @override
//   Future<void> save(List<TodoItemEntity> data) async {
//     await storage.writeData(
//       data,
//       (data) => jsonEncode(data.map((e) => e.toJson()).toList()),
//     );
//   }
//
//   Future<List<TodoItemEntity>> getAll() {
//     // TODO: implement watch
//     throw UnimplementedError();
//   }
//
//   Future<void> saveOne(TodoItemEntity data) async {
//     // TODO: implement watch
//     throw UnimplementedError();
//   }
// }
//
// // class LocalTodoItemRepository extends CollectionRepository<TodoItemEntity> {
// //   LocalTodoItemRepository(this.ref);
// //
// //   final LocalTodoItemRepositoryRef ref;
// //
// //   AppDatabaseProvider provider = appDatabaseProvider();
// //
// //   AirtlsDatabase get database => ref.read(provider);
// //
// //   late final _controller = StreamController<List<TodoItemEntity>>();
// //   late final _stream = _controller.stream.asBroadcastStream();
// //
// //   @override
// //   Stream<List<TodoItemEntity>> watch() {
// //     ref
// //         .watch(provider)
// //         .select(database.todoItems)
// //         .watch()
// //         .listen((List<TodoItemEntity>? event) {
// //       log("Event triggered");
// //       if (event != null) {
// //         _controller.add(event);
// //       }
// //     });
// //
// //     getAll().then((value) => _controller.add(value));
// //     return _stream;
// //   }
// //
// //   @override
// //   Future<void> save(List<TodoItemEntity> data) async {
// //     // Inserts or updates multiple TodoItem entries in the database.
// //     await database.batch((batch) {
// //       batch.insertAllOnConflictUpdate(
// //         database.todoItems,
// //         data.map((item) => item.toCompanion(true)).toList(),
// //       );
// //     });
// //   }
// //
// //   // Save a single TodoItem entry in the database.
// //   Future<void> saveOne(TodoItemEntity data) async {
// //     await database.into(database.todoItems).insert(
// //           TodoItemsCompanion.insert(title: data.title, content: data.content),
// //         );
// //     log("Saved");
// //   }
// //
// //   Future<List<TodoItemEntity>> getAll() async {
// //     return await database.todoItems.select().get();
// //   }
// //
// //   @override
// //   List<TodoItemEntity> get() {
// //     var list = <TodoItemEntity>[];
// //     // return database.todoItems.select().getSync();
// //     var todos = database.todoItems.select().get();
// //
// //     todos.then((value) => list = value);
// //
// //     return list;
// //   }
// //
// //   @override
// //   Future<void> delete(TodoItemEntity data) async {
// //     // Deletes a single TodoItem entry from the database.
// //     await (database.todoItems.delete()..where((tbl) => tbl.id.equals(data.id)))
// //         .go();
// //   }
// //
// //   @override
// //   Future<void> deleteAll() async {
// //     // Deletes all TodoItem entries from the database.
// //     await database.todoItems.delete().go();
// //   }
// // }
