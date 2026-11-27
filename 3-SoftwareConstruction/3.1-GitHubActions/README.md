### Автоматизована перевірка норм кодування програмного коду

Репозиторій для GitHub Actions: власний репозиторій `Laboratory-work-4`; сценарії лежать у `.github/workflows/`.

#### Перевірка версій програмного забезпечення

Сценарій [PrintSoftwareVersions.yml](../../.github/workflows/PrintSoftwareVersions.yml) містить дві роботи за UML-діаграмою розгортання:
- `PrintLanguageVersions` – версії Flutter, Dart (рівень BL) і Java;
- `PrintDBMSVersions` – версія SQLite (рівень AL); виконується після першої роботи (`needs`).

![](PrintSoftwareVersionsResult.jpg)
![](PrintDBMSVersionsResult.jpg)

#### Перевірка норм кодування схеми даних

Сценарій [DataSchemaCodeConvention.yml](../../.github/workflows/DataSchemaCodeConvention.yml): утиліта `sqlfluff`, діалект `sqlite`.

| Експеримент | Файл | Результат | Знімок |
|-------------|------|-----------|--------|
| 1 | [DataSchema.sql](DataSchema.sql) | порушень немає | DataSchemaCodeConventionResult.jpg |
| 2 | [DataSchemaModified.sql](DataSchemaModified.sql) | є порушення | DataSchemaModifiedCodeConventionResult.jpg |

![](DataSchemaCodeConventionResult.jpg)
![](DataSchemaModifiedCodeConventionResult.jpg)

#### Перевірка норм кодування програмного модуля (Dart)

Сценарій [ProgramCodeConvention.yml](../../.github/workflows/ProgramCodeConvention.yml): `dart format --set-exit-if-changed` та `dart analyze --fatal-infos`.

| Експеримент | Файл | Результат | Знімок |
|-------------|------|-----------|--------|
| 1 | [ProgramCode.dart](ProgramCode.dart) | є порушення (форматування, невикористана змінна) | ProgramCodeConventionResult.jpg |
| 2 | [ProgramCodeModified.dart](ProgramCodeModified.dart) | порушень немає | ProgramCodeModifiedCodeConventionResult.jpg |

![](ProgramCodeConventionResult.jpg)
![](ProgramCodeModifiedCodeConventionResult.jpg)
