

import 'package:hive/hive.dart';
import 'package:hive_local_db/notes_app/models/notes_model.dart';

class Boxes {

  // This fetches the data from the box
  static Box<NotesModel> getData() => Hive.box<NotesModel>('notes');
}