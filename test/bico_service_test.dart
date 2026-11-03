import 'package:flutter_test/flutter_test.dart';
import 'package:bicolocal/data/bicos_data.dart';
import 'package:bicolocal/models/bico.dart';
import 'package:bicolocal/services/bico_service.dart';

Bico sample({
  String id = 'test',
  double valor = 100,
  int vagas = 1,
  String fim = '12:00',
}) => Bico(
  id: id,
  titulo: 'Serviço de teste',
  descricao: 'Descrição do serviço de teste',
  categoria: 'Limpeza',
  cidade: 'Rio do Sul',
  bairro: 'Centro',
  valor: valor,
  data: DateTime(2026, 11, 10),
  horarioInicio: '08:00',
  horarioFim: fim,
  quantidadeVagas: vagas,
  dataCriacao: DateTime(2026, 11, 3),
);

void main() {
  group('Bico', () {
    test(
      'aceita um serviço válido',
      () => expect(sample().titulo, 'Serviço de teste'),
    );
    test(
      'rejeita valor não positivo',
      () => expect(() => sample(valor: 0), throwsArgumentError),
    );
    test(
      'rejeita zero vagas',
      () => expect(() => sample(vagas: 0), throwsArgumentError),
    );
    test(
      'rejeita horário final anterior ao inicial',
      () => expect(() => sample(fim: '07:30'), throwsArgumentError),
    );
  });
  group('BicoService', () {
    late BicoService service;
    setUp(() => service = BicoService(bicosIniciais));
    test('filtra por categoria e pesquisa', () {
      expect(service.buscar(categoria: 'Jardinagem'), hasLength(1));
      expect(service.buscar(consulta: 'Ituporanga'), hasLength(1));
      expect(service.buscar(consulta: 'inexistente'), isEmpty);
    });
    test('cadastra e retorna novo serviço no início', () {
      service.cadastrar(sample());
      expect(service.todos.first.id, 'test');
      expect(service.todos, hasLength(bicosIniciais.length + 1));
    });
    test('não registra interesse duplicado', () {
      expect(service.demonstrarInteresse('1'), isTrue);
      expect(service.demonstrarInteresse('1'), isFalse);
    });
  });
}
