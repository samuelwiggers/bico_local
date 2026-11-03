# Evidências e execução

## Capturas de tela

| Tela | Arquivo | Situação em 03/11/2026 |
|---|---|---|
| Explorar/lista | `screenshots/01-explorar.png` | Não capturada: ADB não iniciou neste ambiente |
| Detalhes | `screenshots/02-detalhes.png` | Não capturada |
| Cadastro | `screenshots/03-cadastro.png` | Não capturada |
| Perfil | `screenshots/04-perfil.png` | Não capturada |

Não foram criadas imagens artificiais para substituir capturas do aplicativo executado. A pasta permanece disponível para evidências reais futuras.

## Execução local

```bash
flutter pub get
flutter run
```

Em ambiente sem Android disponível, pode-se tentar `flutter run -d chrome` após habilitar o suporte web no SDK local. As telas web devem ser identificadas como execução web, não como capturas Android.

## Resultados de comandos neste ambiente

- `flutter pub get` inicial tentou acessar pub.dev e falhou por indisponibilidade de rede.
- `flutter pub get --offline` concluiu com dependências do cache local usando `PUB_CACHE=/tmp/bicolocal-pubcache`.
- Flutter 3.41.2 e Dart 3.11.0 foram identificados por cópia temporária do SDK em `/tmp`.
- `dart format .` formatou os arquivos Dart, mas o processo do Dart tentou atualizar telemetria em `/home/samuel/.dart-tool`, fora da área gravável, e terminou com erro de sistema após a formatação.
- `flutter analyze` concluiu sem issues.
- `flutter test` não conseguiu iniciar os dois arquivos de teste: o sandbox bloqueou a abertura de sockets locais (`127.0.0.1`). Os testes estão implementados, mas não há resultado de execução válido.
- `flutter build web` não concluiu: a compilação Dart auxiliar encontrou a mesma restrição de telemetria fora do workspace.
- `flutter build apk --debug` não concluiu porque o Gradle Wrapper precisava baixar Gradle 8.14 e o acesso à rede está indisponível.
- `adb devices -l` não pôde consultar dispositivos: o servidor ADB foi bloqueado pelo sandbox.
- GitHub CLI `gh` não está instalado.
- A inicialização padrão do Git também não pôde escrever na pasta `.git` já existente, que está sem permissão de escrita neste ambiente.

## Pendências

Reexecutar formatação em ambiente sem restrição de telemetria, executar os testes em ambiente que permita sockets locais, compilar e validar em Android; produzir capturas reais. Não existe URL GitHub associada até o momento.
