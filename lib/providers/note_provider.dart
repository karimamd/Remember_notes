import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const String DATABASE_NOTES_TABLE= "Notes";
class Note {
  int id;
  final String title;
  final String text;

  Note({this.title, this.text});
  Note.fromDb({this.id, this.title, this.text});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'text': text,
    }; //end return
  }// toMap method
} // class Note


class NoteProvider {
  static Database db;
  //static int latestIndex=0;

  static Future open() async {
    //await deleteDatabase(join(await getDatabasesPath()));
    db = await openDatabase(
      join(await getDatabasesPath(), 'notes.db'),
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute( '''
          CREATE TABLE Notes( id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT NOT NULL,
            text TEXT NOT NULL);''' );
      } //onCreate
    ); //openDatabase

//   await insertNote({'title': 'inserted title 5', 'text': 'inserted text 1'});
//    await insertNote({"title": "inserted title 6", "text": "inserted text 2"});
//    await insertNote({'title': 'inserted title 7', 'text': 'inserted text 3'});
//    await insertNote({"title": "inserted title 8", "text": "inserted text 4"});


  }// open() method

  static Future<List<Map<String, dynamic>>> getNoteList() async {
    if (db == null) {
      await open();
    }
    var result = await db.query(DATABASE_NOTES_TABLE);
    return result.toList();
  }

  static Future insertNote(Map<String, dynamic> note) async {
    if (db == null) {
      await open();
    }
    await db.insert(DATABASE_NOTES_TABLE, note);
  }

  static Future updateNote(Map<String, dynamic> note) async {
    await db.update(
        DATABASE_NOTES_TABLE,
      note,
      where: 'id = ?',
      whereArgs: [note['id']]);
  }
  static Future updateNoteByTitle(String title,Map<String, dynamic> note) async {
    await db.update(
        DATABASE_NOTES_TABLE,
        note,
        where: 'title = ?',
        whereArgs: [title]);
  }

  static Future deleteNote(int id) async {
    await db.delete(
        DATABASE_NOTES_TABLE,
      where: 'id = ?',
      whereArgs: [id]);
  }
  static Future deleteNoteByTitle(String title) async {
    await db.delete(
        DATABASE_NOTES_TABLE,
        where: 'title = ?',
        whereArgs: [title]);
  }

}