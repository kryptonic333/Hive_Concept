import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

// Box - A file for storing data
// .openBox() creates a file in path directory provided earlier.
// NameOfFile == .openBox('thisName');

class HiveBasics extends StatefulWidget {
  const HiveBasics({super.key});

  @override
  State<HiveBasics> createState() => _HiveBasicsState();
}

class _HiveBasicsState extends State<HiveBasics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Hive Database')),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var box = await Hive.openBox('Info');
          var box2 = await Hive.openBox('what');
          box2.put('Area', 'Urban');
          box.put('Name', 'Joseph');
          box.put('Age', 21);
          box.put('details', {'profession': 'Student', 'year': 2});
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FutureBuilder(
            future: Hive.openBox('Info'),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator(); // Loading spinner
              }
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }
              if (!snapshot.hasData) {
                return Text('Box not found');
              }
              return Column(
                children: [
                  ListTile(
                    title: Text(snapshot.data!.get('Name').toString()),
                    subtitle: Text(snapshot.data!.get('Age').toString()),
                    trailing: IconButton(
                      onPressed: () {
                        snapshot.data!.delete('Name');
                        snapshot.data!.put('Age', 25);
                        setState(() {});
                      },
                      icon: Icon(Icons.delete),
                    ),
                  ),
                ],
              );
            },
          ),
          FutureBuilder(
            future: Hive.openBox('what'),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator(); // Loading spinner
              }
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }
              if (!snapshot.hasData) {
                return Text('Box not found');
              }
              return Column(
                children: [
                  ListTile(
                    title: Text(snapshot.data!.get('Area').toString()),

                    trailing: IconButton(
                      onPressed: () {
                        snapshot.data!.delete('Area');

                        setState(() {});
                      },
                      icon: Icon(Icons.delete),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
