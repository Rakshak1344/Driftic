// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_point_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$localPointRepositoryHash() =>
    r'53e021300e6a16ba5a873729927f2dda1d57e01c';

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

/// See also [localPointRepository].
@ProviderFor(localPointRepository)
const localPointRepositoryProvider = LocalPointRepositoryFamily();

/// See also [localPointRepository].
class LocalPointRepositoryFamily extends Family<LocalPointRepository> {
  /// See also [localPointRepository].
  const LocalPointRepositoryFamily();

  /// See also [localPointRepository].
  LocalPointRepositoryProvider call(
    String dbName,
  ) {
    return LocalPointRepositoryProvider(
      dbName,
    );
  }

  @override
  LocalPointRepositoryProvider getProviderOverride(
    covariant LocalPointRepositoryProvider provider,
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
  String? get name => r'localPointRepositoryProvider';
}

/// See also [localPointRepository].
class LocalPointRepositoryProvider
    extends AutoDisposeProvider<LocalPointRepository> {
  /// See also [localPointRepository].
  LocalPointRepositoryProvider(
    String dbName,
  ) : this._internal(
          (ref) => localPointRepository(
            ref as LocalPointRepositoryRef,
            dbName,
          ),
          from: localPointRepositoryProvider,
          name: r'localPointRepositoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$localPointRepositoryHash,
          dependencies: LocalPointRepositoryFamily._dependencies,
          allTransitiveDependencies:
              LocalPointRepositoryFamily._allTransitiveDependencies,
          dbName: dbName,
        );

  LocalPointRepositoryProvider._internal(
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
  Override overrideWith(
    LocalPointRepository Function(LocalPointRepositoryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LocalPointRepositoryProvider._internal(
        (ref) => create(ref as LocalPointRepositoryRef),
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
  AutoDisposeProviderElement<LocalPointRepository> createElement() {
    return _LocalPointRepositoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LocalPointRepositoryProvider && other.dbName == dbName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, dbName.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LocalPointRepositoryRef on AutoDisposeProviderRef<LocalPointRepository> {
  /// The parameter `dbName` of this provider.
  String get dbName;
}

class _LocalPointRepositoryProviderElement
    extends AutoDisposeProviderElement<LocalPointRepository>
    with LocalPointRepositoryRef {
  _LocalPointRepositoryProviderElement(super.provider);

  @override
  String get dbName => (origin as LocalPointRepositoryProvider).dbName;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
