# Установка To-Do List App
📲 INSTALL.md - Руководство по установке To-Do List App
📋 Содержание

Требования
Установка Flutter
Запуск проекта
Платформо-специфичные настройки
Сборка релизных версий
Тестирование
⚙️ Требования

Компонент	Минимальная версия
Flutter SDK	3.0.0
Dart	3.0.0
Xcode (для iOS)	14.0+
Android Studio	2022.2.1+
macOS	11.0+ (Big Sur)
🚀 Установка Flutter

Для macOS:

Скачайте Flutter SDK:
bash
Copy
cd ~/development
git clone https://github.com/flutter/flutter.git -b stable
Добавьте в PATH:
Отредактируйте ~/.zshrc:
bash
Copy
nano ~/.zshrc
Добавьте строку:
bash
Copy
export PATH="$PATH:$HOME/development/flutter/bin"
Сохраните и примените:
bash
Copy
source ~/.zshrc
Проверьте установку:
bash
Copy
flutter doctor
🔥 Запуск проекта

Клонируйте репозиторий:
bash
Copy
git clone https://github.com/ваш-username/todo_app.git
cd todo_app
Установите зависимости:
bash
Copy
flutter pub get
Запустите приложение:
bash
Copy
# Для iOS (требуется Xcode)
flutter run -d iPhone

# Для Android
flutter run -d emulator-5554

# Для веб
flutter run -d chrome
📱 Платформо-специфичные настройки

iOS:

Установите CocoaPods:
bash
Copy
sudo gem install cocoapods
Инициализируйте Pods:
bash
Copy
cd ios
pod install
Android:

Убедитесь, что в android/local.properties указан путь к SDK:
Copy
sdk.dir=/Users/ваш-username/Library/Android/sdk
Включите мультидекcинг в android/app/build.gradle:
gradle
Copy
defaultConfig {
    multiDexEnabled true
}
📦 Сборка релизных версий

Платформа	Команда	Выходные файлы
iOS	flutter build ios	ios/Runner.app
Android	flutter build apk	build/app/outputs/flutter-apk/app-release.apk
Web	flutter build web	build/web/
Для публикации в App Store/Google Play используйте:

bash
Copy
flutter build appbundle  # Android
flutter build ipa       # iOS
🧪 Тестирование

Unit-тесты:
bash
Copy
flutter test test/
Интеграционные тесты:
bash
Copy
flutter drive --target=test_driver/app.dart
Анализ кода:
bash
Copy
flutter analyze
🛠️ Устранение проблем

Ошибка CocoaPods:
bash
Copy
sudo gem install cocoapods -v 1.11.3
pod repo update
Очистка кеша:
bash
Copy
flutter clean
Обновление зависимостей:
bash
Copy
flutter pub upgrade
🌟 Дополнительно

Для VSCode установите расширения:
Dart
Flutter
Для Android Studio установите плагин Flutter через Preferences > Plugins.
💡 Совет: Все команды выполняйте из корневой папки проекта.
📌 Полная документация Flutter: flutter.dev/docs