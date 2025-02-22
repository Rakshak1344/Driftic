import 'dart:async';

import 'package:driftic/arch/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DriftIcAppConfig extends AppConfig {
  @override
  FutureOr<List<Override>> overrides() async {
    return [];
  }

  @override
  FutureOr<List<ProviderObserver>> observers() {
    return [];
  }

  @override
  Future<void> initDependencies() async {
    return;
  }

  @override
  FutureOr<Widget> onInit({required Widget child}) {
    return child;
  }
}
