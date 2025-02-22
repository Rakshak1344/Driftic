import 'package:driftic/features/in_memory_memory_drift/data/services/todo_item_service.dart';
import 'package:driftic/storage/drift/app_database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo_item_state.g.dart';

@riverpod
class TodoItemState extends _$TodoItemState {
  late final String databaseName;

  TodoItemService get provider =>
      ref.read(todoItemServiceProvider(databaseName));

  @override
  Stream<List<TodoItemEntity>> build(String dbName) {
    databaseName = dbName;
    return ref.watch(todoItemServiceProvider(dbName)).watch();
  }

  void addTodos(List<TodoItemEntity> points) => provider.save(points);
}
