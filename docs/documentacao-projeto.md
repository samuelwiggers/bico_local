# Documentação do projeto BicoLocal

**Estudante:** Samuel Wiggers Martins
**Disciplina:** Desenvolvimento em Plataformas Móveis  
**Data da primeira entrega:** 03/11/2026

## 1. Proposta

O BicoLocal é um protótipo de aplicativo para aproximar pessoas que procuram trabalhos temporários e pequenos serviços de moradores e pequenos negócios que precisam de ajuda pontual. A proposta surgiu da dificuldade de encontrar oportunidades que costumam ser divulgadas separadamente em grupos de mensagens, redes sociais e indicações.

O objetivo geral é facilitar a descoberta de oportunidades locais. Nesta primeira etapa, implementei a listagem, busca, filtro por categoria, detalhes do serviço, cadastro demonstrativo e registro de interesse. O projeto se relaciona aos programas de extensão Desenvolvimento Regional e Desenvolvimento e Cidadania da Unidavi por tratar de oportunidades de trabalho e participação na comunidade do Alto Vale do Itajaí.

O público previsto inclui trabalhadores autônomos, estudantes, pessoas em busca de renda extra, moradores e pequenos estabelecimentos. Os anúncios e o perfil desta versão são fictícios. O aplicativo ainda não realiza contratações reais.

## 2. Requisitos iniciais

### Funcionais

- **RF01:** listar oportunidades com título, categoria, local, valor e data.
- **RF02:** pesquisar por título, categoria, cidade ou bairro e filtrar por categoria.
- **RF03:** abrir os detalhes de uma oportunidade.
- **RF04:** registrar interesse uma única vez por oportunidade durante a sessão.
- **RF05:** cadastrar uma oportunidade e incluí-la na lista atual.
- **RF06:** validar campos obrigatórios, valor positivo, quantidade de vagas maior que zero e horários válidos.
- **RF07:** exibir perfil demonstrativo e oportunidades de interesse.

### Não funcionais e regras

A interface deve ser em português, usar Material 3 e funcionar em Android. O valor precisa ser maior que zero, deve haver pelo menos uma vaga e o horário final deve ser posterior ao inicial. Os dados permanecem somente em memória e são perdidos ao fechar o aplicativo.

## 3. Organização e tecnologias

O projeto foi desenvolvido em Flutter e Dart. Usei recursos nativos de navegação e estado (`setState`), sem backend nesta etapa. A estrutura separa telas, modelo, dados de exemplo, serviço e cartão reutilizável:

```text
lib/
  main.dart
  models/bico.dart
  data/bicos_data.dart
  services/bico_service.dart
  screens/
  widgets/bico_card.dart
test/
```

O modelo `Bico` reúne os dados do serviço, como título, descrição, categoria, local, valor, data, horários e vagas. O `BicoService` mantém a lista e os interesses em memória e concentra busca, filtro e cadastro. A navegação principal liga a exploração ao detalhe, ao cadastro e ao perfil.

## 4. Levantamento com a comunidade

As necessidades descritas até aqui são hipóteses. Não realizei entrevistas nem pesquisa de campo para esta entrega. Pretendo conversar com trabalhadores e contratantes, perguntando como divulgam ou encontram serviços, quais informações consideram necessárias e quais dificuldades enfrentam. Também pretendo perguntar que cuidados de segurança e confiança esperam de uma plataforma.

**Registro de resultados:** a preencher após a pesquisa, informando período, quantidade de participantes, método e síntese das respostas sem identificar as pessoas. Não incluir respostas ou estatísticas antes de coletá-las.

## 5. Planejamento
  
**Próximas etapas:** repetir os testes após o ajuste do formulário, validar o aplicativo em Android, conversar com usuários e decidir quais melhorias cabem no prazo. Login, banco de dados, perfis separados, mapa e persistência são possibilidades para a entrega final, ainda não implementadas.

## 6. Relatório de andamento — 03/11/2026

Nesta primeira etapa, desenvolvi a proposta do BicoLocal como um protótipo móvel para reunir oportunidades de trabalhos temporários e pequenos serviços da região. A ideia considera que esses anúncios podem ficar espalhados em grupos de mensagens, redes sociais e indicações, dificultando que trabalhadores encontrem serviços e que contratantes encontrem ajuda. O projeto está relacionado aos programas de extensão Desenvolvimento Regional e Desenvolvimento e Cidadania da Unidavi.

Implementei a aplicação em Flutter com uma interface em português e identidade visual em azul-petróleo e verde. O protótipo apresenta oportunidades fictícias, permite pesquisar e filtrar por categoria, consultar os detalhes de cada serviço, demonstrar interesse e cadastrar novas oportunidades em memória. Também desenvolvi um perfil demonstrativo que exibe os interesses registrados durante a sessão. O cadastro verifica informações como campos obrigatórios, valor, vagas, data e horários. Como não há banco de dados, os registros não permanecem após o fechamento do aplicativo.

Organizei o código em telas, modelo de dados, serviço, dados de demonstração e componentes reutilizáveis. Também preparei testes para o modelo, a busca, o filtro, o cadastro, a duplicidade de interesse e a interface. Na execução registrada, oito testes passaram e o teste de validação do formulário encontrou um problema com campos fora da área visível. Ajustei o formulário para manter os campos disponíveis à validação, mas ainda preciso executar a suíte novamente para confirmar a correção. A análise estática foi executada sem apontamentos.

A aplicação foi executada no navegador para produzir as capturas incluídas nesta documentação. Elas mostram a exploração, os detalhes de uma oportunidade, o cadastro e o perfil. A execução em Android ainda precisa ser validada. Também não realizei entrevistas ou pesquisa de campo; por isso, as necessidades da comunidade permanecem como hipóteses e os dados apresentados são fictícios.

Como próximos passos, pretendo repetir os testes, executar o aplicativo em Android, conversar com trabalhadores e contratantes e usar as respostas para orientar os ajustes. Para a entrega final, prevista para 01/12/2026, vou avaliar melhorias como persistência, perfis distintos e mapa conforme os requisitos da disciplina e o tempo disponível. Até aqui, o projeto resultou em uma primeira versão navegável e documentada, que ainda precisa de validação técnica e com usuários.

Para executar em um ambiente com Flutter e Android SDK configurados:

```bash
flutter pub get
flutter run
```

Para verificar o código e executar os testes:

```bash
flutter analyze
flutter test
```
