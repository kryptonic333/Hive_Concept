import 'package:flutter/material.dart';
import 'package:hive_local_db/hive_basics.dart';
import 'package:hive_local_db/notes_app/screens/notes_screen.dart';

class OptionScreen extends StatelessWidget {
  const OptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text(' Option Screen ')),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HiveBasics()),
              );
            },
            child: Card(
              child: ListTile(
                title: Text('Hive Basics'),
                subtitle: Text(
                  'This screen shows the basics of hive. To understand more, look into code ',
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
           GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotesScreen()),
              );
            },
            child: Card(
              child: ListTile(
                title: Text('NotesApp'),
                subtitle: Text(
                  'This screen shows how to make a simple note app with hive. To understand more, look into code ',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
