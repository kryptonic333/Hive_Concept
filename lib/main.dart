import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_local_db/notes_app/models/notes_model.dart';
import 'package:hive_local_db/option_screen.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // This line retrieves the path to the app's document directory
  // where you can safely store persistent local files i.e; Hive
  var directory = await getApplicationDocumentsDirectory();

  // This line initializes Hive by setting the storage location
  // for its database files to the app's document directory.
  Hive.init(directory.path);

  // Registering Adapter
  Hive.registerAdapter(NotesModelAdapter());
  await Hive.openBox<NotesModel>('notes');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Hive Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const OptionScreen(),
    );
  }
}
