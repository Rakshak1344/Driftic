import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_item.g.dart';

part 'todo_item.freezed.dart';

@freezed
class TodoItem with _$TodoItem {
  const factory TodoItem({
    required int id,
    required String title,
    required String content,
    required int category,
    required DateTime createdAt,
  }) = _TodoItem;

  factory TodoItem.fromJson(Map<String, Object?> json) =>
      _$TodoItemFromJson(json);
}
