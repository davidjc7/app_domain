// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repositories_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(domainRepository)
const domainRepositoryProvider = DomainRepositoryProvider._();

final class DomainRepositoryProvider
    extends
        $FunctionalProvider<
          DomainRepository,
          DomainRepository,
          DomainRepository
        >
    with $Provider<DomainRepository> {
  const DomainRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'domainRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$domainRepositoryHash();

  @$internal
  @override
  $ProviderElement<DomainRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DomainRepository create(Ref ref) {
    return domainRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DomainRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DomainRepository>(value),
    );
  }
}

String _$domainRepositoryHash() => r'fa6313549213acf2e888bccc3b9deaf442d7c688';
