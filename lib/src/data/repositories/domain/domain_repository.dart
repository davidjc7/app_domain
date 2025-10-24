import 'dart:developer';

import 'package:domain/src/core/result/result.dart';
import 'package:domain/src/data/models/domain_model.dart';
import 'package:domain/src/data/services/domain/domain_service.dart';

class DomainRepository {
  final DomainService domainService;

  DomainRepository(this.domainService);

  Future<Result<Domain>> checkDomain(String domain) async {
    final result = await domainService.checkDomain(domain);

    switch (result) {
      case Success(value: final map):
        final domain = Domain.fromMap(map);
        return Success(domain);
      case Failure(:final error):
        log(
          'Erro ao pesquisar o domíno: $domain',
          name: 'DomainRepository',
          error: error,
        );
        return Failure(error);
    }
  }
}
