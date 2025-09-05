# Building and Running the Application

To build and run the application, you can use the following commands in your terminal:

> In order to link all local packages together and update the dependencies

```bash
melos bootstrap
```

```bash
dart run flutter_native_splash:create
```

```bash
dart run build_runner clean
dart run build_runner build --delete-conflicting-outputs
```

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

```bash
flutter pub run easy_localization:generate -f keys -o locale_keys.g.dart -S assets/translations/

flutter pub run easy_localization:generate -S assets/translations
```

`flutter create --template=package PACKAGE_NAME`
