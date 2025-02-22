import 'package:driftic/features/in_memory_memory_drift/views/in_memory_multi_drift_page.dart';
import 'package:driftic/features/persistence_multi_drift/views/persistence_multi_drift_page.dart';

import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Isolates Demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const InMemoryMultiDriftPage(),
                  ),
                );
              },
              child: const Text("Isolates"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const PersistenceMultiDriftPage(),
                  ),
                );
              },
              child: const Text("Multi Drift Isolate"),
            ),
          ],
        ),
      ),
    );
  }
}
