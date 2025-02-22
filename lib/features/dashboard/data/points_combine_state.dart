import 'package:driftic/features/dashboard/data/services/point_service.dart';
import 'package:driftic/storage/drift/app_database.dart';
import 'package:driftic/storage/drift/utils/database_name.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';

part 'points_combine_state.g.dart';

@riverpod
class PointsCombineState extends _$PointsCombineState {
  @override
  Stream<List<PointEntity>> build() {
    var db1 = ref.watch(pointServiceProvider(DatabaseName.db1)).watch();
    var db2 = ref.watch(pointServiceProvider(DatabaseName.db2)).watch();
    var db3 = ref.watch(pointServiceProvider(DatabaseName.db3)).watch();

    return Rx.combineLatest3(
      db1,
      db2,
      db3,
      (points1, points2, points3) {
        // Combine all the lists into a single list
        return [...points1, ...points2, ...points3];
      },
    );
  }
}
