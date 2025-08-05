import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_local_db/notes_app/boxes/boxes.dart';
import 'package:hive_local_db/notes_app/models/notes_model.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('NOTES APP')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showDialogBox();
        },
        child: Icon(Icons.add_circle_outline_sharp),
      ),
      body: ValueListenableBuilder<Box<NotesModel>>(
        valueListenable: Boxes.getData().listenable(),
        builder: (context, box, _) {
          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index) {
              var data = box.values.toList().cast<NotesModel>();
              return ListTile(
                title: Text(data[index].title.toString()),
                subtitle: Text(data[index].description.toString()),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        deleteVal(data[index]);
                      },
                      icon: Icon(Icons.delete, color: Colors.red),
                    ),
                    SizedBox(width: 10),
                    IconButton(
                      onPressed: () {
                        _showEditDialogBox(
                          data[index],
                          data[index].title.toString(),
                          data[index].description.toString(),
                        );
                      },
                      icon: Icon(Icons.edit),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  // Deleting the value
  void deleteVal(NotesModel note) async {
    await note.delete();
  }

  // updating item in the list
  Future<void> _showEditDialogBox(
    NotesModel note,
    String title,
    String description,
  ) {
    titleController.text = title;
    descriptionController.text = description;
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                  hintText: 'New Heading',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(
                  hintText: ' New Note',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
          title: Text('Edit a Note'),
          actions: [
            TextButton(
              onPressed: () {
                note.title = titleController.text;
                note.description = descriptionController.text;
                note.save();
                titleController.clear();
                descriptionController.clear();
                Navigator.pop(context);
              },
              child: Text('Save '),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  // Adding an item to the list
  Future<void> _showDialogBox() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                  hintText: 'Heading',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(
                  hintText: 'Note',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
          title: Text('Add a Note'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                final data = NotesModel(
                  title: titleController.text,
                  description: descriptionController.text,
                );

                final box = Boxes.getData();
                box.add(data);
                // data.save();
                titleController.clear();
                descriptionController.clear();
              },
              child: Text('Add '),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}
