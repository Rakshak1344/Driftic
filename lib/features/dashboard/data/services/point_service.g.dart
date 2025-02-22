// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'point_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pointServiceHash() => r'c6c39b86fcc01cb49a28ab7676266aa63fea31e0';

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

/// See also [pointService].
@ProviderFor(pointService)
const pointServiceProvider = PointServiceFamily();

/// See also [pointService].
class PointServiceFamily extends Family<PointService> {
  /// See also [pointService].
  const PointServiceFamily();

  /// See also [pointService].
  PointServiceProvider call(
    String databaseName,
  ) {
    return PointServiceProvider(
      databaseName,
    );
  }

  @override
  PointServiceProvider getProviderOverride(
    covariant PointServiceProvider provider,
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
  String? get name => r'pointServiceProvider';
}

/// See also [pointService].
class PointServiceProvider extends AutoDisposeProvider<PointService> {
  /// See also [pointService].
  PointServiceProvider(
    String databaseName,
  ) : this._internal(
          (ref) => pointService(
            ref as PointServiceRef,
            databaseName,
          ),
          from: pointServiceProvider,
          name: r'pointServiceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$pointServiceHash,
          dependencies: PointServiceFamily._dependencies,
          allTransitiveDependencies:
              PointServiceFamily._allTransitiveDependencies,
          databaseName: databaseName,
        );

  PointServiceProvider._internal(
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
    PointService Function(PointServiceRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PointServiceProvider._internal(
        (ref) => create(ref as PointServiceRef),
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
  AutoDisposeProviderElement<PointService> createElement() {
    return _PointServiceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PointServiceProvider && other.databaseName == databaseName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, databaseName.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PointServiceRef on AutoDisposeProviderRef<PointService> {
  /// The parameter `databaseName` of this provider.
  String get databaseName;
}

class _PointServiceProviderElement
    extends AutoDisposeProviderElement<PointService> with PointServiceRef {
  _PointServiceProviderElement(super.provider);

  @override
  String get databaseName => (origin as PointServiceProvider).databaseName;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
