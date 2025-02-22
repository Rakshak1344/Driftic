import 'dart:async';

import 'package:driftic/features/dashboard/data/factories/point_factory.dart';
import 'package:driftic/features/dashboard/data/repositories/local/local_point_repository.dart';
import 'package:driftic/storage/drift/app_database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'point_service.g.dart';

@riverpod
PointService pointService(PointServiceRef ref, String databaseName) {
  return PointService(ref, databaseName);
}

class PointService {
  final PointServiceRef ref;
  final String databaseName;
  final LocalPointRepository _localPointRepository;

  PointService(this.ref, this.databaseName)
      : _localPointRepository =
            ref.read(localPointRepositoryProvider(databaseName));

  Stream<List<PointEntity>> watch() =>
      ref.watch(localPointRepositoryProvider(databaseName)).watch();

  Future<void> save(List<PointEntity> data) async {
    /// This data should be coming from the network layer
    /// For faking we are using factory to generate random data
    var pointData = PointFactory().make();
    var pointEntity = PointEntity(
      id: pointData.id,
      position: pointData.position,
      createdAt: pointData.createdAt,
    );

    await _localPointRepository.save([pointEntity]);
  }

  Future<void> saveOne(PointEntity data) async {
    await _localPointRepository.saveOne(data);
  }

  Future<List<PointEntity>> getAll() async {
    return await _localPointRepository.getAll();
  }

  Future<void> delete(PointEntity data) async {
    await _localPointRepository.delete(data);
  }

  Future<void> deleteAll() async {
    await _localPointRepository.deleteAll();
  }

  List<PointEntity> get() {
    return _localPointRepository.get();
  }

  Future<int> count() async {
    var todos = await _localPointRepository.getAll();
    return todos.length;
  }
}
