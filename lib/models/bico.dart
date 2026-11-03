class Bico {
  Bico({
    required this.id,
    required this.titulo,
    required this.descricao,
    required this.categoria,
    required this.cidade,
    required this.bairro,
    required this.valor,
    required this.data,
    required this.horarioInicio,
    required this.horarioFim,
    required this.quantidadeVagas,
    required this.dataCriacao,
  }) {
    if (titulo.trim().isEmpty) throw ArgumentError('Informe o título.');
    if (valor <= 0) throw ArgumentError('O valor deve ser positivo.');
    if (quantidadeVagas < 1) throw ArgumentError('Informe ao menos uma vaga.');
    if (data.isBefore(
      DateTime(dataCriacao.year, dataCriacao.month, dataCriacao.day),
    )) {
      throw ArgumentError('A data do serviço deve ser válida.');
    }
    if (_minutos(horarioFim) <= _minutos(horarioInicio)) {
      throw ArgumentError('O horário final deve ser posterior ao inicial.');
    }
  }

  final String id, titulo, descricao, categoria, cidade, bairro;
  final double valor;
  final DateTime data, dataCriacao;
  final String horarioInicio, horarioFim;
  final int quantidadeVagas;

  static int _minutos(String value) {
    final parts = value.split(':');
    if (parts.length != 2) throw ArgumentError('Horário inválido.');
    final h = int.tryParse(parts[0]);
    final m = int.tryParse(parts[1]);
    if (h == null || m == null || h < 0 || h > 23 || m < 0 || m > 59) {
      throw ArgumentError('Horário inválido.');
    }
    return h * 60 + m;
  }
}
