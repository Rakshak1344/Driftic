import 'package:driftic/features/dashboard/data/models/point.dart';
import 'package:faker/faker.dart';
import 'package:fixture_factory/fixture_factory.dart';

class PointFactory extends FixtureFactory<PointFactory, Point> {
  PointFactory([super.attributes]);

  var faker = Faker();

  @override
  Point definition() {
    return Point(
      id: faker.randomGenerator.integer(10000, min: 1),
      position: faker.randomGenerator.integer(10000, min: 1),
      createdAt: faker.date.dateTime(),
    );
  }

  @override
  Point fromJson(Map<String, dynamic> json) => Point.fromJson(json);
}
