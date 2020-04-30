import 'screens/note_editor.dart';
import 'screens/note_viewer.dart';
import 'package:flutter/material.dart';

import 'screens/note_adder.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Remember Notes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NoteViewer(),
    );
  }
}