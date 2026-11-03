import '../models/bico.dart';

class BicoService {
  BicoService(Iterable<Bico> iniciais) : _bicos = List.of(iniciais);
  final List<Bico> _bicos;
  final Set<String> _interesses = {};
  List<Bico> get todos => List.unmodifiable(_bicos);
  Set<String> get interesses => Set.unmodifiable(_interesses);

  List<Bico> buscar({String consulta = '', String categoria = 'Todas'}) {
    final q = consulta.trim().toLowerCase();
    return _bicos
        .where(
          (b) =>
              (categoria == 'Todas' || b.categoria == categoria) &&
              (q.isEmpty ||
                  '${b.titulo} ${b.categoria} ${b.cidade} ${b.bairro}'
                      .toLowerCase()
                      .contains(q)),
        )
        .toList();
  }

  void cadastrar(Bico bico) {
    if (_bicos.any((b) => b.id == bico.id)) {
      throw ArgumentError('Identificador já cadastrado.');
    }
    _bicos.insert(0, bico);
  }

  bool demonstrarInteresse(String id) => _interesses.add(id);
}
