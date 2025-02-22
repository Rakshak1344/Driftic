import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:driftic/storage/drift/utils/drift_database_connection.dart';

class MemoryDatabaseConnection extends DriftDatabaseConnection {
  @override
  QueryExecutor call() {
    return NativeDatabase.memory(logStatements: true);
  }
}
