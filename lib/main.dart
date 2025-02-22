import 'package:driftic/config/drift_ic_app_config.dart';
import 'package:driftic/my_app.dart';
import 'package:driftic/splash_app.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const SplashApp());
  DriftIcAppConfig().init(child: const MyApp()).then((widget) {
    runApp(widget);
  });
}
