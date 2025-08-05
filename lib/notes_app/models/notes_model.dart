
 import 'package:hive/hive.dart';

part 'notes_model.g.dart';

// @HiveType(typeId: 0) → Marks a class as Hive-compatible and assigns it a unique type ID.
// @HiveField(0) → Marks a class field to be stored in Hive and assigns it a field index.
// Hive needs TypeAdapters to serialize (save) and deserialize (read) 
// complex objects like custom models.

@HiveType(typeId: (0))
class NotesModel extends HiveObject{
  @HiveField(0)
  String title;
  @HiveField(1)
  String description;

  NotesModel({required this.title, required this.description});
}
