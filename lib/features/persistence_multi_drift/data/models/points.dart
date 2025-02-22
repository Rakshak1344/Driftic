import 'package:drift/drift.dart';
import 'package:driftic/storage/drift/data/auto_incrementing_primary_key.dart';

@DataClassName('PointEntity')
class Points extends Table with AutoIncrementingPrimaryKey {
  IntColumn get position => integer()();

  DateTimeColumn get createdAt => dateTime().nullable()();
}
