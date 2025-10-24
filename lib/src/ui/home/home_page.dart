import 'package:domain/src/core/widgets/app_loading.dart';
import 'package:domain/src/ui/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final _domainController = TextEditingController();

  @override
  void dispose() {
    _domainController.dispose();
    super.dispose();
  }

  void _searchDomain() {
    FocusScope.of(context).unfocus();

    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    final domainName = _domainController.text.trim();
    ref.read(homeViewModelProvider.notifier).searchDomain(domainName);
  }

  @override
  Widget build(BuildContext context) {
    final homeState = ref.watch(homeViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pesquisar Domínio'),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _domainController,
                  decoration: const InputDecoration(
                    labelText: 'Digite o domínio',
                    hintText: 'ex: google.com',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.url,
                  autocorrect: false,
                  textCapitalization: TextCapitalization.none,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Por favor, digite um domínio';
                    }
                    if (!value.contains('.')) {
                      return 'Digite um domínio válido (ex: site.com)';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: homeState.isLoading ? null : _searchDomain,
                    child: homeState.isLoading ? const AppLoading() : const Text('Pesquisar Domínio'),
                  ),
                ),
                const SizedBox(height: 32),
                homeState.when(
                  data: (domain) {
                    if (domain == null) {
                      return const Text(
                        'Aguardando sua pesquisa...',
                        style: TextStyle(color: Colors.grey),
                      );
                    }

                    final bool isRegistered = domain.status?.toLowerCase() != 'available';

                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "${domain.fqdn}",
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "${domain.status}",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: isRegistered ? Colors.red.shade700 : Colors.green.shade700,
                          ),
                        ),
                        if (domain.expiresAt != null) ...[
                          const SizedBox(height: 8),
                          Text('Expira em: ${domain.expiresAt}'),
                        ],
                        if (domain.publicationStatus != null) ...[
                          const SizedBox(height: 8),
                          Text('Status: ${domain.publicationStatus}'),
                        ],
                      ],
                    );
                  },
                  error: (error, stackTrace) {
                    return Text(
                      'Ocorreu um erro: ${error.toString()}',
                      style: TextStyle(
                        color: Colors.red.shade700,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                  loading: () {
                    return const SizedBox(
                      height: 24,
                      child: Center(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
