import 'package:drift/isolate.dart';
import 'package:drift/native.dart';
import 'package:driftic/storage/drift/app_database.dart';
import 'package:driftic/storage/drift/utils/database_file.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_isolate_database_provider.g.dart';

@riverpod
Future<AppDatabase> appIsolateDatabase(
  FutureProviderRef<AppDatabase> ref,
  String databaseName,
) async {
  final file = await DatabaseFile.get(databaseName);

  final isolate = await DriftIsolate.spawn(
    () => NativeDatabase(file, logStatements: true),
  );

  var connection = await isolate.connect();
  return AppDatabase(connection);
}
