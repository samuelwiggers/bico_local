import 'package:flutter/material.dart';
import '../models/bico.dart';
import '../services/bico_service.dart';

class DetalhesBicoScreen extends StatelessWidget {
  const DetalhesBicoScreen({
    super.key,
    required this.bico,
    required this.service,
  });
  final Bico bico;
  final BicoService service;
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Detalhes da oportunidade')),
    body: ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Container(
          height: 140,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Icon(
            Icons.handyman_outlined,
            size: 56,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(height: 20),
        Chip(
          avatar: const Icon(Icons.sell_outlined, size: 17),
          label: Text(bico.categoria),
        ),
        Text(
          bico.titulo,
          style: Theme.of(
            context,
          ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 8),
        _linha(
          context,
          Icons.location_on_outlined,
          '${bico.bairro}, ${bico.cidade}',
        ),
        _linha(
          context,
          Icons.calendar_month_outlined,
          '${bico.data.day}/${bico.data.month}/${bico.data.year} • ${bico.horarioInicio} às ${bico.horarioFim}',
        ),
        _linha(
          context,
          Icons.groups_outlined,
          '${bico.quantidadeVagas} ${bico.quantidadeVagas == 1 ? 'vaga disponível' : 'vagas disponíveis'}',
        ),
        const SizedBox(height: 20),
        const Text(
          'Sobre o serviço',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          bico.descricao,
          style: const TextStyle(height: 1.5, color: Colors.black87),
        ),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondaryContainer,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              const Icon(Icons.payments_outlined),
              const SizedBox(width: 10),
              const Text('Diária / serviço'),
              const Spacer(),
              Text(
                'R\$ ${bico.valor.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 26),
        FilledButton.icon(
          onPressed: service.interesses.contains(bico.id)
              ? null
              : () {
                  final novo = service.demonstrarInteresse(bico.id);
                  if (novo) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Interesse registrado! O contratante poderá entrar em contato.',
                        ),
                      ),
                    );
                  }
                },
          icon: const Icon(Icons.favorite_outline),
          label: Text(
            service.interesses.contains(bico.id)
                ? 'Interesse demonstrado'
                : 'Tenho interesse',
          ),
          style: FilledButton.styleFrom(minimumSize: const Size.fromHeight(52)),
        ),
      ],
    ),
  );
  Widget _linha(BuildContext context, IconData icon, String text) => Padding(
    padding: const EdgeInsets.only(top: 12),
    child: Row(
      children: [
        Icon(icon, size: 20, color: Theme.of(context).colorScheme.primary),
        const SizedBox(width: 10),
        Text(text, style: const TextStyle(color: Colors.black87)),
      ],
    ),
  );
}
