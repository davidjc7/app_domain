import 'package:domain/src/core/rest_client/rest_client_provider.dart';
import 'package:domain/src/data/services/domain/domain_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'services_provider.g.dart';

@riverpod
DomainService domainService(Ref ref) {
  return DomainService(restClient: ref.read(restClientProvider));
}
