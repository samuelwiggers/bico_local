# BicoLocal

## Integrante

- ``Samuel Wiggers Martins``

Aplicativo Flutter acadêmico para aproximar pessoas que oferecem trabalho pontual de moradores e pequenos negócios que precisam de ajuda local. O projeto é desenvolvido na disciplina **Desenvolvimento em Plataformas Móveis**, com relação aos programas de extensão Desenvolvimento Regional e Desenvolvimento e Cidadania.

As oportunidades e o perfil apresentados nesta versão são fictícios e usados apenas para demonstração.

## Objetivos

Explorar uma forma simples de reunir oportunidades locais e implementar um protótipo móvel navegável, com documentação, requisitos e testes proporcionais à primeira entrega acadêmica.

## Funcionalidades nesta versão

- Lista de oportunidades com busca textual e filtro por categoria.
- Detalhes com localidade, remuneração, data, horário, descrição e vagas.
- Demonstração de interesse sem duplicação durante a sessão.
- Cadastro validado e inclusão imediata em memória.
- Perfil demonstrativo com interesses registrados.

Os dados por enquanto não são persistidos depois que o aplicativo é fechado.

## Tecnologias

- Flutter 3.41.2 / Dart 3.11.0 (ambiente usado nesta etapa).
- Material 3, `setState` e navegação nativa do Flutter.
- Android como plataforma principal; scaffold também inclui Web para eventual validação visual.
- Testes com `flutter_test`.

## Instalação e execução

Com Flutter e Android SDK configurados:

```bash
flutter pub get
flutter run
```

Para listar dispositivos: `flutter devices`. Para execução Web, se habilitada no SDK: `flutter run -d chrome`.

## Documentação e evidências

A documentação, o relatório de andamento e as capturas de tela estão reunidos em [`docs/documentacao-projeto.md`](docs/documentacao-projeto.md). As capturas foram feitas no navegador com Flutter Web de primeiro momento.
