import 'package:drift/drift.dart';
import 'package:driftic/storage/drift/data/has_auto_incrementing_primary_key.dart';
import 'package:driftic/storage/drift/data/has_timestamps.dart';

@DataClassName('PointEntity')
class Points extends Table with HasAutoIncrementingPrimaryKey {
  IntColumn get position => integer()();

  DateTimeColumn get createdAt => dateTime().nullable()();
}
