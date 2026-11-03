import 'package:flutter/material.dart';
import '../models/bico.dart';

class CadastrarBicoScreen extends StatefulWidget {
  const CadastrarBicoScreen({super.key, required this.onSave});
  final ValueChanged<Bico> onSave;
  @override
  State<CadastrarBicoScreen> createState() => _CadastrarBicoScreenState();
}

class _CadastrarBicoScreenState extends State<CadastrarBicoScreen> {
  final _form = GlobalKey<FormState>();
  final _titulo = TextEditingController(),
      _descricao = TextEditingController(),
      _cidade = TextEditingController(),
      _bairro = TextEditingController(),
      _valor = TextEditingController(),
      _vagas = TextEditingController(text: '1');
  String _categoria = 'Limpeza', _inicio = '08:00', _fim = '12:00';
  DateTime? _data;
  static const _categorias = [
    'Mudanças',
    'Limpeza',
    'Jardinagem',
    'Eventos',
    'Construção',
    'Serviços gerais',
  ];
  @override
  void dispose() {
    _titulo.dispose();
    _descricao.dispose();
    _cidade.dispose();
    _bairro.dispose();
    _valor.dispose();
    _vagas.dispose();
    super.dispose();
  }

  InputDecoration _dec(String label, IconData icon) => InputDecoration(
    labelText: label,
    prefixIcon: Icon(icon),
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide.none,
    ),
  );
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Publicar oportunidade')),
    body: Form(
      key: _form,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Conte sobre o serviço',
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 4),
            const Text(
              'Preencha os dados para encontrar ajuda na sua região.',
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _titulo,
              decoration: _dec('Título do bico', Icons.work_outline),
              validator: (v) =>
                  v == null || v.trim().isEmpty ? 'Informe um título.' : null,
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              initialValue: _categoria,
              decoration: _dec('Categoria', Icons.category_outlined),
              items: _categorias
                  .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                  .toList(),
              onChanged: (v) => setState(() => _categoria = v!),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _descricao,
              decoration: _dec(
                'Descrição',
                Icons.notes_outlined,
              ).copyWith(alignLabelWithHint: true),
              minLines: 3,
              maxLines: 5,
              validator: (v) => v == null || v.trim().length < 10
                  ? 'Descreva o serviço (mínimo 10 caracteres).'
                  : null,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _cidade,
                    decoration: _dec('Cidade', Icons.location_city_outlined),
                    validator: (v) =>
                        v == null || v.trim().isEmpty ? 'Obrigatório' : null,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    controller: _bairro,
                    decoration: _dec('Bairro', Icons.place_outlined),
                    validator: (v) =>
                        v == null || v.trim().isEmpty ? 'Obrigatório' : null,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _valor,
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    decoration: _dec('Valor (R\$)', Icons.payments_outlined),
                    validator: (v) {
                      final n = double.tryParse((v ?? '').replaceAll(',', '.'));
                      return n == null || n <= 0
                          ? 'Informe valor positivo.'
                          : null;
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    controller: _vagas,
                    keyboardType: TextInputType.number,
                    decoration: _dec('Vagas', Icons.groups_outlined),
                    validator: (v) {
                      final n = int.tryParse(v ?? '');
                      return n == null || n < 1 ? 'Mínimo 1 vaga.' : null;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            OutlinedButton.icon(
              onPressed: () async {
                final d = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now().add(const Duration(days: 1)),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 365)),
                );
                if (d != null) setState(() => _data = d);
              },
              icon: const Icon(Icons.calendar_month_outlined),
              label: Text(
                _data == null
                    ? 'Selecionar data'
                    : '${_data!.day}/${_data!.month}/${_data!.year}',
              ),
              style: OutlinedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
            ),
            if (_data == null)
              const Padding(
                padding: EdgeInsets.only(left: 12, top: 4),
                child: Text(
                  'A data é obrigatória.',
                  style: TextStyle(color: Colors.black54, fontSize: 12),
                ),
              ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _timeField(
                    'Início',
                    _inicio,
                    (v) => setState(() => _inicio = v),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _timeField(
                    'Fim',
                    _fim,
                    (v) => setState(() => _fim = v),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 22),
            FilledButton.icon(
              onPressed: _salvar,
              icon: const Icon(Icons.publish_outlined),
              label: const Text('Publicar bico'),
              style: FilledButton.styleFrom(
                minimumSize: const Size.fromHeight(52),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    ),
  );
  Widget _timeField(
    String label,
    String value,
    ValueChanged<String> onChange,
  ) => InputDecorator(
    decoration: _dec(label, Icons.schedule),
    child: InkWell(
      onTap: () async {
        final t = await showTimePicker(
          context: context,
          initialTime: TimeOfDay(
            hour: int.parse(value.substring(0, 2)),
            minute: int.parse(value.substring(3)),
          ),
        );
        if (t != null) {
          onChange(
            '${t.hour.toString().padLeft(2, '0')}:${t.minute.toString().padLeft(2, '0')}',
          );
        }
      },
      child: Text(value),
    ),
  );
  void _salvar() {
    if (!_form.currentState!.validate()) return;
    if (_data == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Selecione a data do serviço.')),
      );
      return;
    }
    try {
      final b = Bico(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        titulo: _titulo.text.trim(),
        descricao: _descricao.text.trim(),
        categoria: _categoria,
        cidade: _cidade.text.trim(),
        bairro: _bairro.text.trim(),
        valor: double.parse(_valor.text.replaceAll(',', '.')),
        data: _data!,
        horarioInicio: _inicio,
        horarioFim: _fim,
        quantidadeVagas: int.parse(_vagas.text),
        dataCriacao: DateTime.now(),
      );
      widget.onSave(b);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Oportunidade publicada com sucesso!')),
      );
      Navigator.of(context).pop();
    } on ArgumentError catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.message.toString())));
    }
  }
}
