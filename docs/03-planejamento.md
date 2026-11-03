# Planejamento

## Escopo e etapas

O recorte da primeira entrega é um protótipo Android em Flutter com dados em memória, navegação entre exploração, detalhe, formulário e perfil, mais documentação e testes objetivos. O plano total de referência é de **10 horas** para planejamento, análise e apresentações e **30 horas** para desenvolvimento; os tempos efetivamente dedicados devem ser preenchidos pela equipe, sem presumir que correspondem às referências.

| Período de referência | Etapa | Resultado esperado |
|---|---|---|
| Até 03/11/2026 | Planejamento e análise | proposta, requisitos, arquitetura e protótipo funcional inicial |
| 04–10/11 | Validação inicial | revisão de requisitos e coleta de necessidades, se autorizada e realizada |
| 11–20/11 | Desenvolvimento | refinamento de interface, regras e testes |
| 21–27/11 | Revisão | testes em dispositivo, correções e preparação de apresentação |
| 28/11–01/12 | Apresentação | protótipo final, vídeo de até três minutos e entrega |

As datas posteriores são planejamento, não atividades já concluídas.

## Divisão de tarefas

| Atividade | Integrante responsável | Horas realizadas |
|---|---|---|
| Análise e documentação | [preencher] | [preencher] |
| Interface e navegação | [preencher] | [preencher] |
| Modelo, regras e testes | [preencher] | [preencher] |
| Apresentação e vídeo | [preencher] | [preencher] |

## Tecnologias

Flutter e Dart, Material 3, recursos nativos de estado e navegação e Git. A entrega não utiliza Firebase ou serviço remoto. Android é a plataforma principal; web pode apoiar inspeção visual quando disponível.

## Riscos e respostas

- **Acesso limitado a usuários para validação:** registrar como pendência e não apresentar hipóteses como resultados.
- **Ambiente sem emulador acessível:** executar análise e testes locais; repetir validação em dispositivo Android no ambiente de desenvolvimento.
- **Dados de demonstração confundidos com oportunidades reais:** identificar explicitamente como fictícios.
- **Escopo crescer antes da entrega:** priorizar critérios de aceitação da primeira etapa.

## Estratégia de testes

Testes unitários cobrem validação do modelo, busca/filtro, cadastro e interesse duplicado. Teste de widget verifica interface inicial e navegação para perfil. A equipe deve complementar com execução em Android, preenchimento manual do formulário e inspeção das capturas reais. Resultados executados são registrados em `07-evidencias.md`.
