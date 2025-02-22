import 'package:drift/isolate.dart';
import 'package:drift/native.dart';
import 'package:driftic/storage/drift/app_database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_in_memory_database_provider.g.dart';

/// If used @riverpod without keepAlive the database will be
/// removed from the memory if on navigation or any events
@Riverpod(keepAlive: true)
Future<AppDatabase> appInMemoryDatabase(
  FutureProviderRef<AppDatabase> ref,
  String dbKey, /// Parse the database key for
) async {
  final isolate = await DriftIsolate.spawn(
    () => NativeDatabase.memory(logStatements: true),
  );

  var connection = await isolate.connect();
  print('✅ In-memory database "$dbKey" initialized!');
  return AppDatabase(connection);
}
