import 'package:designs/screens/note_adder.dart';
import 'package:designs/screens/note_editor.dart';
import 'package:flutter/material.dart';

class NoteViewer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String _notetext =
        'This is an intentionally large text This is an intentionally large text This is an intentionally large text This is an intentionally large text This is an intentionally large text This is an intentionally large text to see how the note will lookThis is an intentionally large text to see how the note will lookThis is an intentionally large text to see how the note will lookThis is an intentionally large text to see how the note will lookThis is an intentionally large text to see how the note will lookThis is an intentionally large text to see how the note will lookThis is an intentionally large text to see how the note will lookThis is an intentionally large text to see how the note will lookThis is an intentionally large text to see how the note will lookThis is an intentionally large text to see how the note will lookThis is an intentionally large text to see how the note will lookThis is an intentionally large text to see how the note will look';
    return Scaffold(
        appBar: AppBar(
          title: Text('Note Viewer'),
        ),
        body:
        Stack(
          children: <Widget>[
            ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      'Title Placeholder',
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    _notetext,
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.2,),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Align(
                //alignment: FractionalOffset.bottomCenter,
                alignment: Alignment(0.5, 0.9),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    NoteButton('Previous', Colors.amber, (){_previousNote(context);}),
                    NoteButton('Edit', Colors.grey, (){_editNote(context);}),
                    NoteButton('New', Colors.green, (){_newNote(context);}),
                    NoteButton('Next', Colors.amber, (){_nextNote(context);}),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
  //TODO implement those methods
void  _previousNote(context){}
void  _nextNote(context){}
//  Future _editNote(context) async {
//    //TODO Load prevous note from database or cache
//  }
//
//  Future _nextNote(context) async {
//    //TODO Load next note from database
//  }
  Future _editNote(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => NoteEditor()));
  }

  Future _newNote(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => NoteAdder()));
  }
}

class NoteButton extends StatelessWidget {
  final String _text;
  final Color _color;
  final Function _onPressed;

  NoteButton(this._text, this._color, this._onPressed);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: _onPressed,
      child: Text(
        _text,
        style: TextStyle(color: Colors.white),
      ),
      height: 50,
      minWidth: MediaQuery.of(context).size.width *0.2,
      color: _color,
    );
  }
}
