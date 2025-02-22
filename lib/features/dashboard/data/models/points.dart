import 'package:drift/drift.dart';

@DataClassName('PointEntity')
class Points extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get position => integer()();

  DateTimeColumn get createdAt => dateTime().nullable()();
}
