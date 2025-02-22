import 'package:drift/drift.dart';
import 'package:driftic/features/persistence_multi_drift/data/models/points.dart';
import 'package:driftic/features/in_memory_memory_drift/data/models/todo_items.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [TodoItems, Points])
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.executor);

  @override
  int get schemaVersion => 1;
}
