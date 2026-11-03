import 'package:flutter/material.dart';
import 'data/bicos_data.dart';
import 'models/bico.dart';
import 'screens/cadastrar_bico_screen.dart';
import 'screens/detalhes_bico_screen.dart';
import 'screens/home_screen.dart';
import 'screens/perfil_screen.dart';
import 'services/bico_service.dart';

void main() => runApp(const BicoLocalApp());

class BicoLocalApp extends StatefulWidget {
  const BicoLocalApp({super.key});
  @override
  State<BicoLocalApp> createState() => _BicoLocalAppState();
}

class _BicoLocalAppState extends State<BicoLocalApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  final _service = BicoService(bicosIniciais);
  int _aba = 0;
  static const _petroleo = Color(0xff145b59), _verde = Color(0xff3a9b78);
  ThemeData get _tema {
    final scheme = ColorScheme.fromSeed(
      seedColor: _petroleo,
      primary: _petroleo,
      secondary: _verde,
      surface: const Color(0xfff5f8f6),
    );
    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: const Color(0xfff5f8f6),
      fontFamily: 'Roboto',
      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          side: const BorderSide(color: Color(0xffe8eeeb)),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xffdfe8e4)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xffdfe8e4)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: _petroleo, width: 1.5),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
    navigatorKey: _navigatorKey,
    title: 'BicoLocal',
    debugShowCheckedModeBanner: false,
    theme: _tema,
    home: Scaffold(
      body: _aba == 0
          ? HomeScreen(service: _service, onSelect: _abrir)
          : PerfilScreen(
              interesses: _service.interesses,
              bicos: _service.todos,
            ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _aba,
        onDestinationSelected: (i) {
          setState(() => _aba = i);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.explore_outlined),
            selectedIcon: Icon(Icons.explore),
            label: 'Explorar',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
      floatingActionButton: _aba == 0
          ? FloatingActionButton.extended(
              onPressed: _cadastrar,
              icon: const Icon(Icons.add),
              label: const Text('Publicar'),
            )
          : null,
    ),
  );
  void _abrir(Bico bico) => _navigatorKey.currentState!
      .push(
        MaterialPageRoute<void>(
          builder: (_) => DetalhesBicoScreen(bico: bico, service: _service),
        ),
      )
      .then((_) => setState(() {}));
  void _cadastrar() => _navigatorKey.currentState!
      .push(
        MaterialPageRoute<void>(
          builder: (_) => CadastrarBicoScreen(
            onSave: (b) {
              _service.cadastrar(b);
              setState(() {});
            },
          ),
        ),
      )
      .then((_) => setState(() {}));
}
