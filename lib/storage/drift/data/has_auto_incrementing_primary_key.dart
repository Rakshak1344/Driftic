import 'package:drift/drift.dart';

mixin HasAutoIncrementingPrimaryKey on Table {
  IntColumn get id => integer().autoIncrement()();
}