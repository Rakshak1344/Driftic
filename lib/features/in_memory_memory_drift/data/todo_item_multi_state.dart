import 'package:driftic/features/in_memory_memory_drift/data/services/todo_item_service.dart';
import 'package:driftic/storage/drift/app_database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';

part 'todo_item_multi_state.g.dart';

@Riverpod(keepAlive: true)
class TodoItemMultiState extends _$TodoItemMultiState {
  /// Holds active database names
  final List<String> databaseNames = [];

  /// Initializes the state with combined streams from all databases
  @override
  Stream<List<TodoItemEntity>> build() {
    return _combineDatabaseStreams();
  }

  /// Creates a new in-memory database based on user request
  Future<void> createInMemoryDb(String dbName) async {
    if (!databaseNames.contains(dbName)) {
      databaseNames.add(dbName);
      state = const AsyncLoading();
      state = await AsyncValue.guard(() => _combineDatabaseStreams().first);
    }
  }

  /// Removes an existing in-memory database
  Future<void> removeInMemoryDb(String dbName) async {
    if (databaseNames.contains(dbName)) {
      databaseNames.remove(dbName);
      state = const AsyncLoading();
      state = await AsyncValue.guard(() => _combineDatabaseStreams().first);
    }
  }

  /// Combines all database streams into a single merged stream
  Stream<List<TodoItemEntity>> _combineDatabaseStreams() {
    if (databaseNames.isEmpty) return Stream.value([]);

    final streams = databaseNames.map((dbName) {
      return ref.watch(todoItemServiceProvider(dbName)).watch();
    });

    return Rx.combineLatestList(streams).map((listOfLists) {
      return listOfLists.expand((list) => list).toList();
    });
  }
}
