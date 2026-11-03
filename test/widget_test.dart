import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bicolocal/main.dart';
import 'package:bicolocal/screens/cadastrar_bico_screen.dart';

void main() {
  testWidgets('mostra oportunidades e navegação principal', (tester) async {
    await tester.pumpWidget(const BicoLocalApp());
    expect(find.text('BicoLocal'), findsOneWidget);
    expect(find.text('Oportunidades'), findsOneWidget);
    expect(find.text('Explorar'), findsOneWidget);
    await tester.tap(find.text('Perfil'));
    await tester.pumpAndSettle();
    expect(find.text('Alex Silva'), findsOneWidget);
  });

  testWidgets(
    'formulário informa erros quando campos obrigatórios estão vazios',
    (tester) async {
      var salvou = false;
      await tester.pumpWidget(
        MaterialApp(home: CadastrarBicoScreen(onSave: (_) => salvou = true)),
      );
      await tester.scrollUntilVisible(
        find.text('Publicar bico'),
        300,
        scrollable: find.byType(Scrollable).first,
      );
      await tester.tap(find.text('Publicar bico'));
      await tester.pumpAndSettle();
      expect(find.text('Informe um título.'), findsOneWidget);
      expect(salvou, isFalse);
    },
  );
}
