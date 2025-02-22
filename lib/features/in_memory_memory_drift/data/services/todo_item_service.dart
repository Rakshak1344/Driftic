import 'dart:async';

import 'package:driftic/features/in_memory_memory_drift/data/factories/todo_item_factory.dart';
import 'package:driftic/features/in_memory_memory_drift/data/repositories/local/local_todo_item_repository.dart';
import 'package:driftic/storage/drift/app_database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo_item_service.g.dart';

@riverpod
TodoItemService todoItemService(TodoItemServiceRef ref, String databaseName) {
  return TodoItemService(ref, databaseName);
}

class TodoItemService {
  final TodoItemServiceRef ref;
  final String databaseName;
  final LocalTodoItemRepository _localTodoItemRepository;

  TodoItemService(this.ref, this.databaseName)
      : _localTodoItemRepository =
            ref.read(localTodoItemRepositoryProvider(databaseName));

  Stream<List<TodoItemEntity>> watch() =>
      ref.watch(localTodoItemRepositoryProvider(databaseName)).watch();

  Future<void> save(List<TodoItemEntity> data) async {
    /// This data should be coming from the network layer
    /// For faking we are using factory to generate random data
    var todo = TodoItemFactory().make();
    var todoItemEntity = TodoItemEntity(
      id: todo.id,
      title: todo.title,
      createdAt: todo.createdAt,
      content: todo.content,
    );

    await _localTodoItemRepository.save([todoItemEntity]);
  }

  Future<void> saveOne(TodoItemEntity data) async {
    await _localTodoItemRepository.saveOne(data);
  }

  Future<List<TodoItemEntity>> getAll() async {
    return await _localTodoItemRepository.getAll();
  }

  Future<void> delete(TodoItemEntity data) async {
    await _localTodoItemRepository.delete(data);
  }

  Future<void> deleteAll() async {
    await _localTodoItemRepository.deleteAll();
  }

  List<TodoItemEntity> get() {
    return _localTodoItemRepository.get();
  }

  Future<int> count() async {
    var todos = await _localTodoItemRepository.getAll();
    return todos.length;
  }
}
