import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:domain/src/core/exceptions/app_exception.dart';
import 'package:domain/src/core/result/result.dart';

class DomainService {
  final Dio restClient;

  DomainService({
    required this.restClient,
  });

  Future<Result<Map<String, dynamic>>> checkDomain(String domain) async {
    try {
      final Response response = await restClient.get('/registrobr/v1/$domain');

      return Success(response.data);
    } on DioException catch (e, s) {
      log('Erro ao pesquisar o domínio', name: 'DomainService', error: e, stackTrace: s);
      return Failure(AppException('Erro ao tentar pesquisar o domínio.'));
    }
  }
}
