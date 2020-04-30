import 'note_adder.dart';
import 'note_editor.dart';
import 'package:flutter/material.dart';
List dummyNotes = [
  {
    'title': 'title 1',
    'text': 'text 1'
  },
  {
    'title': 'title 2',
    'text': 'text 2'
  },
  {
    'title': 'title 3',
    'text': 'text 3'
  }
  ];
class NoteViewer extends StatefulWidget {
  @override
  _NoteViewerState createState() => _NoteViewerState();
}

class _NoteViewerState extends State<NoteViewer> {
  int _index= 0;
  void _incrementIndex() {
    setState( () {_index= (_index+1) % dummyNotes.length;} );
  }
  void _decrementIndex() {
    setState( () {_index= _index==0 ? dummyNotes.length-1 : (_index-1);} );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Note Viewer'),
        ),
        body:
        Stack(
          children: <Widget>[
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width*0.95,
                //color: Colors.brown,
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          dummyNotes[_index]['title'],
                          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        dummyNotes[_index]['text'] ,
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*0.2,),
                  ],
                ),
              ),
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
                    NoteButton('Edit', Colors.grey, (){_editNote(context, _index);}),
                    NoteButton('New', Colors.green, (){_newNote(context);}),
                    NoteButton('Next', Colors.amber, (){_nextNote(context);}),
                  ],
                ),
              ),
            ),
          ],
        ));
  }



  Future _previousNote(context) async {
    _decrementIndex();
  }
  Future _nextNote(context) async {
    _incrementIndex();
  }

  Future _editNote(context, passedIndex) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => NoteEditor(_index)));
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
