import 'package:dio/dio.dart';
import 'package:driftic/arch/generics/response.dart';
import 'package:driftic/config/network/network/network_config.dart';
import 'package:driftic/features/dashboard/data/models/todo_item.dart';
import 'package:retrofit/http.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'network_todo_item_repository.g.dart';

@riverpod
NetworkTodoItemRepository networkTodoItemRepository(
  NetworkTodoItemRepositoryRef ref,
) {
  return NetworkTodoItemRepository(ref.read(dioProvider));
}

@RestApi()
abstract class NetworkTodoItemRepository {
  factory NetworkTodoItemRepository(Dio dio, {String baseUrl}) =
      _NetworkTodoItemRepository;

  @GET("/todos")
  Future<CollectionResponse<TodoItem>> getTodos();
}
