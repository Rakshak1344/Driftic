import 'package:driftic/arch/logger.dart';
import 'package:driftic/features/dashboard/data/point_state.dart';
import 'package:driftic/features/dashboard/data/points_combine_state.dart';
import 'package:driftic/storage/drift/app_database.dart';
import 'package:driftic/storage/drift/utils/database_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({super.key});

  @override
  ConsumerState createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<DashboardPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String dbName = DatabaseName.db1;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    _tabController.addListener(() {
      dbName = getDBName();
    });
    log(_tabController.index);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Dashboard"),
          bottom: TabBar(
            controller: _tabController,
            tabs: const [
              Tab(icon: Icon(Icons.data_object), text: 'DB1'),
              Tab(icon: Icon(Icons.data_object), text: 'DB2'),
              Tab(icon: Icon(Icons.data_object), text: 'DB3'),
              Tab(icon: Icon(Icons.data_object), text: 'All'),
            ],
          ),
          actions: [
            ref.watch(pointStateProvider(DatabaseName.db1)).when(
                  data: (points) => Text("Count ${points.length}"),
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
        body: TabBarView(
          controller: _tabController,
          children: [
            ref.watch(pointStateProvider(DatabaseName.db1)).when(
                  data: buildListView,
                  error: (e, s) => const Text("Error"),
                  loading: () => const CircularProgressIndicator(),
                ),
            ref.watch(pointStateProvider(DatabaseName.db2)).when(
                  data: buildListView,
                  error: (e, s) => const Text("Error"),
                  loading: () => const CircularProgressIndicator(),
                ),
            ref.watch(pointStateProvider(DatabaseName.db3)).when(
                  data: buildListView,
                  error: (e, s) => const Text("Error"),
                  loading: () => const CircularProgressIndicator(),
                ),
            ref.watch(pointsCombineStateProvider).when(
                  data: buildListView,
                  error: (e, s) => const Text("Error"),
                  loading: () => const CircularProgressIndicator(),
                ),
          ],
        ),
      ),
    );
  }

  Widget buildListView(List<PointEntity> points) {
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
                subtitle: Text(points[i].position.toString()),
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
    if (_tabController.indexIsChanging) {
      return;
    }
    var dbName = getDBName();
    ref.read(pointStateProvider(dbName).notifier).addPoints([]);
  }

  String getDBName() {
    switch (_tabController.index) {
      case 0:
        return DatabaseName.db1;
      case 1:
        return DatabaseName.db2;
      case 2:
        return DatabaseName.db3;
      default:
        return DatabaseName.db1;
    }
  }
}
