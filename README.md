

## Структура проекта

- **resources** - темы, иконки, в дальнейшем возможно константы для ui
- **core** - ядро, которое делится на presentation, domain и data (см. _Core-часть_)
- **injection** - настройка Dependency Injection

!!! Импорт пакетов только с nullsafty и портами для всех платформ

### Presentation

Presentation делится на две составляющие: часть UI и часть бизнес-логики компонента (BLoC).

**BLoC** - это логика _представления_ для конкретной сущности View, имеющая эвенты (event) на вход и состояние (state) на выход. Обычно event это [sink](https://api.dart.dev/stable/2.9.1/dart-core/Sink-class.html), а state - [stream](https://dart.dev/tutorials/language/streams). Реализуется посредством [этого пакета](https://pub.dev/packages/flutter_bloc).

**View** - часть представления, которая делегирует всю логику (в т.ч. навигацию) BLoC'у. Представляет из себя отдельный экран, который инициализируется посредством внутреннего роутинга приложения (директория screens).
Каждый экран или виджет храниться в отдельной папке, если:

- Работает с bloc
- Должен по разному рендерится на разных платформах

Для определения таких виджетов используется `Decider`.

Знает о domain-сущностях, не знает о data.

- **router** - роутинг приложения, содержит виджет навигатора и BLoC
- **screens** - каждый конкретный экран приложения, содержит лейаут и BLoC
- **widgets** - содержит переиспользуемые всем приложением компоненты

### Domain

Часть бизнес-логики приложения. Не зависит ни от части представления, ни от части данных.

Принимает на вход Entity, при необходимости преобразует данные для соответствия бизнес-логике, и отдает Entity.

Также содержит юзкейсы, которые являются прослойкой между слоем бизнес-логики и data-слоем.

### Data

Через интерфейсы DAO (data access object) и API services оперирует моделями данных.

Часть repository представляет собой некий пограничный слой, который дёргает DAO или API, ловит ошибки и возвращает данных в понятном для domain виде.

Не знает о presentation, но использует модели данных из domain. По сути просто "пережёвывает" данные и отдает domain-части.

## Навигация

Навигация реализуется через утилиту [Navigator 2.0](https://medium.com/flutter/learning-flutters-new-navigation-and-routing-system-7c9068155ade).

Стейт-менеджер - BLoC, как и для экранов приложения.

Намерение перейти на конкретный экран - event, текущий стек экранов - state.

Последовательность действий для добавления экрана:

1. Добавить новый event в RouterEvent и перегенерировать freezed
2. Добавить обработчик для перехода внутри RouterBloc
3. Добавить в класс ScreenProvider новое поле, задать id роута и добавить сам экран

### Генерация кода

Код генерируется через build runner для пакетов freezed, injectable, hive (для адаптеров) и graphql-запросов.

Для генерации graphql-запросов следует в папке lib/core/data/network/models создать .graphql-файл, добавить свой запрос и запустить генерацию.

Запуск билд раннера: `flutter pub run build_runner watch --delete-conflicting-outputs` для периодического ребилда или `flutter pub run build_runner build --delete-conflicting-outputs`

#### Генерация DI

Чтобы добавить фабрику/синглтон, нужно:

1. Пометить класс аннотацией @Injectable()/@Singleton(). В случае, если класс реализует интерфейс, в аннотации можно указать, какой именно класс будет сгенерирован:

```
abstract class SampleClass {
    ...
}


@Injectable(as: SampleClass)

class SampleClassImpl implements SampleClass {
    ...
}
```

2. Запустить кодогенерацию.

Также добавить зависимость можно вручную. Например:

```
getIt.registerFactory<SampleClass>(() => SampleClass());
```

#### Distribution

Для дистребьюции на устройства используется Firebase App Distribution. Сборки можно добавлять 2 способами:
1 - Вручную apk, ipa через Firebase консоль
2 - Через Fastlane 

Fastlane - утилита для развертывания и выпуска приложений https://docs.fastlane.tools
Гайд по fastlane через Firebase (https://inostudio.com/blog/articles-develop/firebase-app-distribution-rassylaem-flutter-sborki-testirovshchikam/)

Скрипты (Fastfile) уже созданы и лежат в своих папках

## IOS

Для сборки IOS требуется перейти в папку ios (cd ios) и выполнить команду:  bundle exec fastlane distribute_internal_ios
После этого нужно оправить dSYM файлы (для крашлитикса) в Firebase с помошью команды: 

"TOTOPATH"/ios/Pods/FirebaseCrashlytics/upload-symbols -gsp "TOTOPATH"/ios/Runner/GoogleService-Info.plist -p ios "TOTOPATH"/ios/Runner.app.dSYM.zip

Примечания: 

Если у вас нет сертификата для дистрибьюции (или приватного ключа к нему), придется создавать новый в Apple Developer
https://developer.apple.com/support/certificates/ - про сертификаты

## Android

Для сборки Android требуется перейти в папку ios (cd android) и выполнить команду:  bundle exec fastlane distribute_internal_android

Примечания:
У меня почему то AndroidStudio не хотел подтягивать javaSDK, поэтому я прописывал путь руками в gradle.properties
org.gradle.java.home=/Applications/Android Studio.app/Contents/jre/Contents/Home (у вас может быть другой путь)