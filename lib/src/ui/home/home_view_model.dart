import 'package:domain/src/core/result/result.dart';
import 'package:domain/src/data/models/domain_model.dart';
import 'package:domain/src/data/repositories/repositories_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_view_model.g.dart';

@riverpod
class HomeViewModel extends _$HomeViewModel {
  @override
  AsyncValue<Domain?> build() {
    return const AsyncValue.data(null);
  }

  Future<void> searchDomain(String domain) async {
    final domainRepository = ref.read(domainRepositoryProvider);

    state = const AsyncValue.loading();

    final result = await domainRepository.checkDomain(domain);
    state = switch (result) {
      Success(value: final data) => AsyncValue.data(data),
      Failure(:final error) => throw AsyncValue.error(error, StackTrace.current),
    };
  }
}
