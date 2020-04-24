import 'package:flutter/material.dart';

class NoteViewer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String _notetext =
        'This is an intentionally large text This is an intentionally large text This is an intentionally large text This is an intentionally large text This is an intentionally large text This is an intentionally large text to see how the note will lookThis is an intentionally large text to see how the note will lookThis is an intentionally large text to see how the note will lookThis is an intentionally large text to see how the note will lookThis is an intentionally large text to see how the note will lookThis is an intentionally large text to see how the note will lookThis is an intentionally large text to see how the note will lookThis is an intentionally large text to see how the note will lookThis is an intentionally large text to see how the note will lookThis is an intentionally large text to see how the note will lookThis is an intentionally large text to see how the note will lookThis is an intentionally large text to see how the note will look';
    return Scaffold(
        drawer: Drawer(),
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
                    _NoteButton('Previous', Colors.amber, _previousNote),
                    _NoteButton('Edit', Colors.grey, _editNote),
                    _NoteButton('New', Colors.green, _editNote),
                    _NoteButton('Next', Colors.amber, _nextNote),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
  //TODO implement those methods
  void _nextNote() {}

  void _previousNote() {}

  void _editNote() {}
}

class _NoteButton extends StatelessWidget {
  final String _text;
  final Color _color;
  final Function _onPressed;

  _NoteButton(this._text, this._color, this._onPressed);

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
