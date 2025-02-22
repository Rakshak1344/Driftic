import 'package:driftic/features/in_memory_memory_drift/data/todo_item_state.dart';
import 'package:driftic/storage/drift/app_database.dart';
import 'package:driftic/storage/drift/utils/database_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InMemoryMultiDriftPage extends ConsumerStatefulWidget {
  const InMemoryMultiDriftPage({super.key});

  @override
  ConsumerState createState() => _InMemoryMultiDriftPageState();
}

class _InMemoryMultiDriftPageState extends ConsumerState<InMemoryMultiDriftPage>
    with SingleTickerProviderStateMixin {
  var db = DatabaseName.db1;
  var dbs = <String>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("In-Memory DriftIsolate Page"),
        actions: [
          ref.watch(todoItemStateProvider(db)).when(
                data: (todos) => Text("Count ${todos.length}"),
                error: (e, s) => const Text(""),
                loading: () => const Center(
                  child: SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator()),
                ),
              ),
          // const SizedBox(width: 8),
          // IconButton(
          //   icon: const Icon(Icons.delete_forever),
          //   onPressed: onDeleteAllTap,
          // ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addToDoItem,
        child: const Icon(Icons.add),
      ),
      body: ref.watch(todoItemStateProvider(db)).when(
            data: buildListView,
            error: (e, s) => const Text("Error"),
            loading: () => const CircularProgressIndicator(),
          ),
    );
  }

  Widget buildListView(List<TodoItemEntity> points) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: points.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, i) {
              return ListTile(
                // trailing: IconButton(
                //   icon: const Icon(Icons.delete),
                //   onPressed: () => deleteTodoItem(points[i]),
                // ),
                title: Text(points[i].id.toString()),
                subtitle: Text(points[i].title.toString()),
              );
            },
          ),
        ),
      ],
    );
  }

  void deleteTodoItem(TodoItemEntity todoItem) {
    // ref.read(todoItemStateProvider.notifier).delete(todoItem);
  }

  void onDeleteAllTap() {
    // ref.read(todoItemStateProvider.notifier).deleteAll();
  }

  Future<void> addToDoItem() async {
    ref.read(todoItemStateProvider(db).notifier).addTodos([]);
  }
}
