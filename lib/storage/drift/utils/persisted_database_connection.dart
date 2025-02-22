import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:driftic/storage/drift/utils/database_file.dart';
import 'package:driftic/storage/drift/utils/database_name.dart';
import 'package:driftic/storage/drift/utils/drift_database_connection.dart';

class PersistedDatabaseConnection extends DriftDatabaseConnection {
  @override
  QueryExecutor call() {
    return LazyDatabase(() async {
      var file = await DatabaseFile.get(DatabaseName.db1);
      return NativeDatabase.createInBackground(file, logStatements: true);
    });
  }
}
