import 'package:driftic/features/in_memory_memory_drift/data/todo_item_multi_state.dart';
import 'package:driftic/features/in_memory_memory_drift/data/todo_item_state.dart';
import 'package:driftic/storage/drift/app_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MultiInMemoryDbScreen extends ConsumerStatefulWidget {
  const MultiInMemoryDbScreen({super.key});

  @override
  ConsumerState<MultiInMemoryDbScreen> createState() =>
      _MultiInMemoryDbScreenState();
}

class _MultiInMemoryDbScreenState extends ConsumerState<MultiInMemoryDbScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _initTabController();
  }

  void _initTabController() {
    final dbCount =
        ref.read(todoItemMultiStateProvider.notifier).databaseNames.length;
    _tabController = TabController(length: dbCount, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _addDatabase() async {
    final dbCount =
        ref.read(todoItemMultiStateProvider.notifier).databaseNames.length + 1;
    final dbName = 'db_$dbCount.sqlite';
    await ref
        .read(todoItemMultiStateProvider.notifier)
        .createInMemoryDb(dbName);
    _initTabController();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(todoItemMultiStateProvider);
    final dbNames = ref.read(todoItemMultiStateProvider.notifier).databaseNames;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Multi-In-Memory Drift DB'),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Text('Instances: ${dbNames.length}'),
                  state.when(
                      data: (List<TodoItemEntity> todoItems) =>
                          Text("Count: ${todoItems.length.toString()}"),
                      error: (e, s) => const Text('Error'),
                      loading: () => const SizedBox()),
                  // Text('count: ${dbNames.length}'),
                ],
              ),
            ),
          ),
          IconButton(
            onPressed: _addDatabase,
            icon: const Icon(Icons.add),
            tooltip: 'Add Database',
          ),
        ],
        bottom: dbNames.isNotEmpty
            ? TabBar(
                controller: _tabController,
                isScrollable: true,
                tabs: dbNames.map((name) => Tab(text: name)).toList(),
              )
            : null,
      ),
      body: state.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('Error: $error')),
        data: (todoItems) {
          if (dbNames.isEmpty) {
            return const Center(
              child: Text('In-Memory database count: 0'),
            );
          }

          return TabBarView(
            controller: _tabController,
            children: [
              for (final dbName in dbNames)
                ref.watch(todoItemStateProvider(dbName)).when(
                      data: (todoItems) {
                        return Column(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                itemCount: todoItems.length,
                                itemBuilder: (context, index) {
                                  final item = todoItems[index];
                                  return ListTile(
                                    title: Text(item.title),
                                    subtitle: Text(item.content),
                                  );
                                },
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                ref
                                    .read(
                                        todoItemStateProvider(dbName).notifier)
                                    .addTodos([]);
                              },
                              child: const Text("Add Item"),
                            ),
                          ],
                        );
                      },
                      error: (e, s) => const Text('Error'),
                      loading: () => const CircularProgressIndicator(),
                    ),
            ],
            // dbNames.map((dbName) {
            //   final filteredItems =
            //       todoItems.where((TodoItemEntity item) => item.dbName == dbName).toList();
            //
            //   return ListView.builder(
            //     itemCount: filteredItems.length,
            //     itemBuilder: (context, index) {
            //       final item = filteredItems[index];
            //       return ListTile(
            //         title: Text(item.title),
            //         subtitle: Text(item.content),
            //       );
            //     },
            //   );
            // }).toList(),
          );
        },
      ),
    );
  }
}
//
//
// class InMemoryMultiDriftPage extends ConsumerStatefulWidget {
//   const InMemoryMultiDriftPage({super.key});
//
//   @override
//   ConsumerState createState() => _InMemoryMultiDriftPageState();
// }
//
// class _InMemoryMultiDriftPageState extends ConsumerState<InMemoryMultiDriftPage>
//     with SingleTickerProviderStateMixin {
//   var db = DatabaseName.db1;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("In-Memory DriftIsolate Page"),
//         actions: [
//           ref.watch(todoItemStateProvider(db)).when(
//                 data: (todos) => Text("Count ${todos.length}"),
//                 error: (e, s) => const Text(""),
//                 loading: () => const Center(
//                   child: SizedBox(
//                       width: 20,
//                       height: 20,
//                       child: CircularProgressIndicator()),
//                 ),
//               ),
//           // const SizedBox(width: 8),
//           // IconButton(
//           //   icon: const Icon(Icons.delete_forever),
//           //   onPressed: onDeleteAllTap,
//           // ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: addToDoItem,
//         child: const Icon(Icons.add),
//       ),
//       body: ref.watch(todoItemStateProvider(db)).when(
//             data: buildListView,
//             error: (e, s) => const Text("Error"),
//             loading: () => const CircularProgressIndicator(),
//           ),
//     );
//   }
//
//   Widget buildListView(List<TodoItemEntity> points) {
//     return Column(
//       children: [
//         Expanded(
//           child: ListView.builder(
//             itemCount: points.length,
//             physics: const BouncingScrollPhysics(),
//             itemBuilder: (context, i) {
//               return ListTile(
//                 // trailing: IconButton(
//                 //   icon: const Icon(Icons.delete),
//                 //   onPressed: () => deleteTodoItem(points[i]),
//                 // ),
//                 title: Text(points[i].id.toString()),
//                 subtitle: Text(points[i].title.toString()),
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
//
//   void deleteTodoItem(TodoItemEntity todoItem) {
//     // ref.read(todoItemStateProvider.notifier).delete(todoItem);
//   }
//
//   void onDeleteAllTap() {
//     // ref.read(todoItemStateProvider.notifier).deleteAll();
//   }
//
//   Future<void> addToDoItem() async {
//     ref.read(todoItemStateProvider(db).notifier).addTodos([]);
//   }
// }
