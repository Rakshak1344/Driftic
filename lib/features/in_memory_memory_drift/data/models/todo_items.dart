import 'package:drift/drift.dart';
import 'package:driftic/storage/drift/data/auto_incrementing_primary_key.dart';

@DataClassName('TodoItemEntity')
class TodoItems extends Table with AutoIncrementingPrimaryKey{

  TextColumn get title => text().withLength(min: 6, max: 32)();

  TextColumn get content => text().named('body')();

  DateTimeColumn get createdAt => dateTime().nullable()();
}
