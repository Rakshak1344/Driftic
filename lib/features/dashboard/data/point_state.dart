import 'package:driftic/features/dashboard/data/services/point_service.dart';
import 'package:driftic/storage/drift/app_database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'point_state.g.dart';

@riverpod
class PointState extends _$PointState {
  late final String databaseName;

  PointService get provider => ref.read(pointServiceProvider(databaseName));

  @override
  Stream<List<PointEntity>> build(String dbName) {
    databaseName = dbName;
    return ref.watch(pointServiceProvider(dbName)).watch();
  }

  void addPoints(List<PointEntity> points) => provider.save(points);
}
