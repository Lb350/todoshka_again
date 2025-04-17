# INSTALL.md


# 🛠Установка To-Do App

## 📦 Требования
- Flutter SDK 3.19.5+
- Dart 3.3.0+
- iOS: Xcode 15.0+
- Android: API 33+

## 🚀 Быстрый старт
```bash
git clone https://github.com/lb350/todoshka_again.git
cd todo_app
flutter pub get
flutter run
```

## 📱 Платформы
### iOS
```bash
cd ios
pod install
open Runner.xcworkspace
```
### Android
1. Создайте android/local.properties:
```bash
sdk.dir=/path/to/android/sdk
```
2. Запустите через Android Studio
### Web
```bash
flutter create --platforms web .
flutter run -d chrome
```

## 🏷 Сборка

|Платформа|Команда|Выходные файлы|
|---------|-------|--------------|
|Android|flutter build apk|build/app/outputs/apk|
|iOS|flutter build ipa|build/ios/ipa|
|Web|flutter build web|build/web|

## 🧪 Тестирование
```bash
flutter test
flutter drive --target=test_driver/app.dart
```


