// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'point_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pointStateHash() => r'6eda7f66eaf24b761424457dccfb70722328196b';

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

abstract class _$PointState
    extends BuildlessAutoDisposeStreamNotifier<List<PointEntity>> {
  late final String dbName;

  Stream<List<PointEntity>> build(
    String dbName,
  );
}

/// See also [PointState].
@ProviderFor(PointState)
const pointStateProvider = PointStateFamily();

/// See also [PointState].
class PointStateFamily extends Family<AsyncValue<List<PointEntity>>> {
  /// See also [PointState].
  const PointStateFamily();

  /// See also [PointState].
  PointStateProvider call(
    String dbName,
  ) {
    return PointStateProvider(
      dbName,
    );
  }

  @override
  PointStateProvider getProviderOverride(
    covariant PointStateProvider provider,
  ) {
    return call(
      provider.dbName,
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
  String? get name => r'pointStateProvider';
}

/// See also [PointState].
class PointStateProvider extends AutoDisposeStreamNotifierProviderImpl<
    PointState, List<PointEntity>> {
  /// See also [PointState].
  PointStateProvider(
    String dbName,
  ) : this._internal(
          () => PointState()..dbName = dbName,
          from: pointStateProvider,
          name: r'pointStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$pointStateHash,
          dependencies: PointStateFamily._dependencies,
          allTransitiveDependencies:
              PointStateFamily._allTransitiveDependencies,
          dbName: dbName,
        );

  PointStateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.dbName,
  }) : super.internal();

  final String dbName;

  @override
  Stream<List<PointEntity>> runNotifierBuild(
    covariant PointState notifier,
  ) {
    return notifier.build(
      dbName,
    );
  }

  @override
  Override overrideWith(PointState Function() create) {
    return ProviderOverride(
      origin: this,
      override: PointStateProvider._internal(
        () => create()..dbName = dbName,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        dbName: dbName,
      ),
    );
  }

  @override
  AutoDisposeStreamNotifierProviderElement<PointState, List<PointEntity>>
      createElement() {
    return _PointStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PointStateProvider && other.dbName == dbName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, dbName.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PointStateRef on AutoDisposeStreamNotifierProviderRef<List<PointEntity>> {
  /// The parameter `dbName` of this provider.
  String get dbName;
}

class _PointStateProviderElement
    extends AutoDisposeStreamNotifierProviderElement<PointState,
        List<PointEntity>> with PointStateRef {
  _PointStateProviderElement(super.provider);

  @override
  String get dbName => (origin as PointStateProvider).dbName;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
