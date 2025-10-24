import 'package:domain/src/data/repositories/domain/domain_repository.dart';
import 'package:domain/src/data/services/services_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repositories_provider.g.dart';

@riverpod
DomainRepository domainRepository(Ref ref) {
  final domainService = ref.read(domainServiceProvider);
  return DomainRepository(domainService);
}
