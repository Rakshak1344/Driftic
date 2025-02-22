import 'dart:io';

import 'package:driftic/storage/drift/utils/database_name.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseFile {
  static Future<File> get(String databaseName) async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/$databaseName');
  }
}
