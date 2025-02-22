import 'package:dio/dio.dart';
import 'package:driftic/config/network/network/env.dart';
import 'package:driftic/config/network/network/interceptors/pretty_logger.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'network_config.g.dart';

@riverpod
Dio dio(DioRef ref) {
  var appUrl = Env.baseUrl;

  var dio = Dio(
    BaseOptions(
      baseUrl: appUrl,
      headers: {"Accept": "application/json"},
    ),
  );

  dio.interceptors.addAll([
    // ref.read(authInterceptorProvider),
    if (!kReleaseMode) ...debugInterceptors(ref),
  ]);

  return dio;
}

List<Interceptor> debugInterceptors(DioRef ref) {
  return [
    ref.read(prettyDioLoggerProvider),
  ];
}
