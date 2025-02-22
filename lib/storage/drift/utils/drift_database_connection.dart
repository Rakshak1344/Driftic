import 'package:drift/drift.dart';

abstract class DriftDatabaseConnection {
   QueryExecutor call();
}
