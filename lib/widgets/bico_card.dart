import 'package:flutter/material.dart';
import '../models/bico.dart';

class BicoCard extends StatelessWidget {
  const BicoCard({super.key, required this.bico, required this.onTap});
  final Bico bico;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: cs.secondaryContainer,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      bico.categoria,
                      style: TextStyle(
                        color: cs.onSecondaryContainer,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.verified_outlined,
                    size: 17,
                    color: Color(0xff28876f),
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    'Oportunidade',
                    style: TextStyle(fontSize: 11, color: Colors.black54),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                bico.titulo,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    size: 17,
                    color: Colors.black54,
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      '${bico.bairro}, ${bico.cidade}',
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Text(
                    'R\$ ${bico.valor.toStringAsFixed(0)}',
                    style: TextStyle(
                      color: cs.primary,
                      fontWeight: FontWeight.w800,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(
                    Icons.calendar_month_outlined,
                    size: 16,
                    color: Colors.black54,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    '${bico.data.day.toString().padLeft(2, '0')}/${bico.data.month.toString().padLeft(2, '0')}/${bico.data.year}',
                    style: const TextStyle(color: Colors.black54, fontSize: 12),
                  ),
                  const SizedBox(width: 12),
                  const Icon(
                    Icons.schedule_outlined,
                    size: 16,
                    color: Colors.black54,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    '${bico.horarioInicio} – ${bico.horarioFim}',
                    style: const TextStyle(color: Colors.black54, fontSize: 12),
                  ),
                  const Spacer(),
                  const Icon(Icons.arrow_forward_ios, size: 14),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
