import 'package:flutter/material.dart';
import '../models/bico.dart';
import '../services/bico_service.dart';
import '../widgets/bico_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.service, required this.onSelect});
  final BicoService service;
  final ValueChanged<Bico> onSelect;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _categoria = 'Todas';
  String _busca = '';
  static const _categorias = [
    'Todas',
    'Mudanças',
    'Limpeza',
    'Jardinagem',
    'Eventos',
    'Construção',
    'Serviços gerais',
  ];
  @override
  Widget build(BuildContext context) {
    final lista = widget.service.buscar(
      consulta: _busca,
      categoria: _categoria,
    );
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: const Icon(
                          Icons.handyman_outlined,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'BicoLocal',
                            style: Theme.of(context).textTheme.titleLarge
                                ?.copyWith(fontWeight: FontWeight.w800),
                          ),
                          const Text(
                            'Oportunidades por perto',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Você está vendo oportunidades fictícias para demonstração.',
                            ),
                          ),
                        ),
                        icon: const Icon(Icons.info_outline),
                      ),
                    ],
                  ),
                  const SizedBox(height: 22),
                  Text(
                    'Olá, tudo bem?',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Encontre um bico e faça acontecer na sua região.',
                    style: TextStyle(color: Colors.black54),
                  ),
                  const SizedBox(height: 18),
                  TextField(
                    onChanged: (v) => setState(() => _busca = v),
                    decoration: InputDecoration(
                      hintText: 'O que você está procurando?',
                      prefixIcon: const Icon(Icons.search),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        'Oportunidades',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '${lista.length} encontradas',
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 40,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: _categorias
                          .map(
                            (c) => Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: ChoiceChip(
                                label: Text(c),
                                selected: _categoria == c,
                                onSelected: (_) =>
                                    setState(() => _categoria = c),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  const SizedBox(height: 14),
                ],
              ),
            ),
          ),
          if (lista.isEmpty)
            SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.search_off_outlined,
                      size: 52,
                      color: Colors.grey.shade400,
                    ),
                    const SizedBox(height: 10),
                    const Text('Nenhuma oportunidade encontrada'),
                    const Text(
                      'Tente outra busca ou categoria.',
                      style: TextStyle(color: Colors.black54),
                    ),
                  ],
                ),
              ),
            )
          else
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 100),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, i) => BicoCard(
                    bico: lista[i],
                    onTap: () => widget.onSelect(lista[i]),
                  ),
                  childCount: lista.length,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
