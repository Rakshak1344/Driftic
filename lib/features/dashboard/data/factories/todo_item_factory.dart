import 'package:driftic/features/dashboard/data/models/todo_item.dart';
import 'package:faker/faker.dart';
import 'package:fixture_factory/fixture_factory.dart';

class TodoItemFactory extends FixtureFactory<TodoItemFactory, TodoItem> {
  TodoItemFactory([super.attributes]);

  var faker = Faker();

  @override
  TodoItem definition() {
    return TodoItem(
      id: faker.randomGenerator.integer(10000, min: 1),
      title: faker.randomGenerator.string(12, min: 6),
      category: faker.randomGenerator.integer(100),
      content: faker.lorem.sentence(),
      createdAt: faker.date.dateTime(),
    );
  }

  @override
  TodoItem fromJson(Map<String, dynamic> json) => TodoItem.fromJson(json);
}
