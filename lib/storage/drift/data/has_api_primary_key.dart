import 'package:drift/drift.dart';

mixin HasApiPrimaryKey on Table {
  IntColumn get id => integer()();
}
