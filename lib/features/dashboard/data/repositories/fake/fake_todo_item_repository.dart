import 'package:driftic/arch/generics/response.dart';
import 'package:driftic/features/dashboard/data/factories/todo_item_factory.dart';
import 'package:driftic/features/dashboard/data/models/todo_item.dart';
import 'package:driftic/features/dashboard/data/repositories/network/network_todo_item_repository.dart';
import 'package:faker/faker.dart';

class FakeTodoItemRepository implements NetworkTodoItemRepository {
  var faker = Faker();

  @override
  Future<CollectionResponse<TodoItem>> getTodos() async {
    var todoItems = TodoItemFactory().makeMany(164).cast<TodoItem>();
    return CollectionResponse(todoItems);
  }

// @override
// Future<TodoItems> getTodoss() async{
//   var factory = TodoItemFactory();
//   List<TodoItem> todoItems = factory.makeMany(164);
//   return  todoItems.;
//
//   TodoItemsCompanion.insert(title: faker.name, content: content)
//   throw UnimplementedError();
// }
}
