# 📝 Notes App with Hive in Flutter

This is a simple offline Notes App built using [Flutter](https://flutter.dev/) and [Hive](https://docs.hivedb.dev/) for local data storage. It supports adding, editing, deleting, and storing notes persistently using Hive — a lightweight and blazing-fast key-value database for Flutter.

---

## 📁 Folder Structure

```
├── main.dart
├── option_screen.dart
├── notes_app
│ ├── boxes # Hive box helper file
│ ├── models # Hive data model (e.g., NotesModel)
│ └── screens # UI Screens (e.g., Home Screen, Add/Edit Notes Screen)
│
└── hive_basics.dart # Example to test Hive basics (can be ignored in production)
```

---

## 🛠️ Features

- Add a new note
- Edit existing notes
- Delete notes
- Save data locally using Hive


---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK installed
- Hive and Hive Flutter packages
- Code editor (VS Code, Android Studio, etc.)

### Dependencies

Add the following dependencies in your `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  hive: ^2.2.3
  hive_flutter: ^1.1.0
  path_provider: ^2.1.2
```
Also include the following for Hive TypeAdapter generation:
```
dev_dependencies:
  hive_generator: ^2.0.1
  build_runner: ^2.4.6
```
Make sure to initialize Hive in the main.dart:
```
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(NotesModelAdapter());
  await Hive.openBox<NotesModel>('notes');
  runApp(const MyApp());
}
```

This project serves as a foundational step in mastering local data storage in Flutter using Hive. As a developer, focusing on scalable architecture and modularization from the start will help you transition smoothly into more complex app development. Keep exploring, keep building.

Happy coding! 🚀

#📚 Resources & Credits
This project was inspired by the Hive Database Flutter Tutorial by @Asif Taj on YouTube. Highly recommended for beginners looking to understand local storage in Flutter.

