// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'services_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(domainService)
const domainServiceProvider = DomainServiceProvider._();

final class DomainServiceProvider
    extends $FunctionalProvider<DomainService, DomainService, DomainService>
    with $Provider<DomainService> {
  const DomainServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'domainServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$domainServiceHash();

  @$internal
  @override
  $ProviderElement<DomainService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DomainService create(Ref ref) {
    return domainService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DomainService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DomainService>(value),
    );
  }
}

String _$domainServiceHash() => r'a26012bd2ada7d5280c9b8ba48f1310c9252eb18';
