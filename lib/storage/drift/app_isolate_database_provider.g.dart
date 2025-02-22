// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_isolate_database_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appIsolateDatabaseHash() =>
    r'2682460d161d5007df7ddf30ba917deaa35ade94';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [appIsolateDatabase].
@ProviderFor(appIsolateDatabase)
const appIsolateDatabaseProvider = AppIsolateDatabaseFamily();

/// See also [appIsolateDatabase].
class AppIsolateDatabaseFamily extends Family<AsyncValue<AppDatabase>> {
  /// See also [appIsolateDatabase].
  const AppIsolateDatabaseFamily();

  /// See also [appIsolateDatabase].
  AppIsolateDatabaseProvider call(
    String databaseName,
  ) {
    return AppIsolateDatabaseProvider(
      databaseName,
    );
  }

  @override
  AppIsolateDatabaseProvider getProviderOverride(
    covariant AppIsolateDatabaseProvider provider,
  ) {
    return call(
      provider.databaseName,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'appIsolateDatabaseProvider';
}

/// See also [appIsolateDatabase].
class AppIsolateDatabaseProvider
    extends AutoDisposeFutureProvider<AppDatabase> {
  /// See also [appIsolateDatabase].
  AppIsolateDatabaseProvider(
    String databaseName,
  ) : this._internal(
          (ref) => appIsolateDatabase(
            ref as AppIsolateDatabaseRef,
            databaseName,
          ),
          from: appIsolateDatabaseProvider,
          name: r'appIsolateDatabaseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$appIsolateDatabaseHash,
          dependencies: AppIsolateDatabaseFamily._dependencies,
          allTransitiveDependencies:
              AppIsolateDatabaseFamily._allTransitiveDependencies,
          databaseName: databaseName,
        );

  AppIsolateDatabaseProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.databaseName,
  }) : super.internal();

  final String databaseName;

  @override
  Override overrideWith(
    FutureOr<AppDatabase> Function(AppIsolateDatabaseRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AppIsolateDatabaseProvider._internal(
        (ref) => create(ref as AppIsolateDatabaseRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        databaseName: databaseName,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<AppDatabase> createElement() {
    return _AppIsolateDatabaseProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AppIsolateDatabaseProvider &&
        other.databaseName == databaseName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, databaseName.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AppIsolateDatabaseRef on AutoDisposeFutureProviderRef<AppDatabase> {
  /// The parameter `databaseName` of this provider.
  String get databaseName;
}

class _AppIsolateDatabaseProviderElement
    extends AutoDisposeFutureProviderElement<AppDatabase>
    with AppIsolateDatabaseRef {
  _AppIsolateDatabaseProviderElement(super.provider);

  @override
  String get databaseName =>
      (origin as AppIsolateDatabaseProvider).databaseName;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
