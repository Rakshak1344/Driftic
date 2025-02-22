import 'package:driftic/features/dashboard/data/factories/point_factory.dart';
import 'package:driftic/features/dashboard/data/models/point.dart';
import 'package:faker/faker.dart';

class FakePointRepository {
  var faker = Faker();

  Future<Point> getPoint() async => PointFactory().make();
}
