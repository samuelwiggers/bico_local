import 'package:flutter/material.dart';
import '../models/bico.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({
    super.key,
    required this.interesses,
    required this.bicos,
  });
  final Set<String> interesses;
  final List<Bico> bicos;
  @override
  Widget build(BuildContext context) {
    final salvos = bicos.where((b) => interesses.contains(b.id)).toList();
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(Icons.person_outline, color: Colors.white),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Meu perfil',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const Text(
                    'Conta demonstrativa',
                    style: TextStyle(color: Colors.black54),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 22),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 38,
                    backgroundColor: Theme.of(
                      context,
                    ).colorScheme.secondaryContainer,
                    child: Icon(
                      Icons.person,
                      size: 44,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Alex Silva',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Trabalhador autônomo • Rio do Sul, SC',
                    style: TextStyle(color: Colors.black54),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.favorite,
                        color: Color(0xff28876f),
                        size: 19,
                      ),
                      const SizedBox(width: 6),
                      Text('${interesses.length} oportunidades de interesse'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Meus interesses',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          if (salvos.isEmpty)
            Card(
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Row(
                  children: [
                    const Icon(
                      Icons.lightbulb_outline,
                      color: Color(0xff28876f),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Quando demonstrar interesse em um bico, ele aparecerá aqui.',
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                    ),
                  ],
                ),
              ),
            )
          else
            ...salvos.map(
              (b) => ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.work_outline),
                title: Text(b.titulo),
                subtitle: Text(
                  '${b.cidade} • R\$ ${b.valor.toStringAsFixed(0)}',
                ),
              ),
            ),
          const SizedBox(height: 18),
          Card(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: const Padding(
              padding: EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sobre o BicoLocal',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Uma iniciativa acadêmica para aproximar trabalhadores e contratantes, fortalecendo oportunidades e a cidadania no Alto Vale do Itajaí.',
                    style: TextStyle(height: 1.4),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Os dados de perfil e as oportunidades são fictícios e usados somente para demonstração.',
            style: TextStyle(color: Colors.black54, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
