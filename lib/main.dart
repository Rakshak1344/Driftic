import 'package:driftic/drift_ic_app_config.dart';
import 'package:driftic/features/dashboard/views/dashboard_page.dart';
import 'package:driftic/my_app.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
  DriftIcAppConfig().init(child: const DashboardPage()).then((widget) {
    runApp(widget);
  });

}
