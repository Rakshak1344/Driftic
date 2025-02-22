import 'package:driftic/storage/drift/app_database.dart';
import 'package:driftic/storage/drift/utils/persisted_database_connection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_database_provider.g.dart';

@riverpod
AppDatabase appDatabase(AppDatabaseRef ref) =>
    AppDatabase(PersistedDatabaseConnection().call());
