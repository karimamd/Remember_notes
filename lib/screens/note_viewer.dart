import 'package:designs/providers/note_provider.dart';

import 'note_adder.dart';
import 'note_editor.dart';
import 'package:flutter/material.dart';

// list of note objects from now on
List dummyNotes =  [];

class NoteViewer extends StatefulWidget {
  @override
  _NoteViewerState createState() => _NoteViewerState();
}

class _NoteViewerState extends State<NoteViewer> {

  int _index= 0;
  int noteId=1;
  int gestureSensitivity = 10;
  void _incrementIndex() async {
    setState( () {_index= (_index+1) % dummyNotes.length;} );
  }
  void _decrementIndex() {
    setState( () {_index= _index==0 ? dummyNotes.length-1 : (_index-1);} );
  }

@override
  void initState() {
    // TODO: implement initState
    _loadDB();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    _index= _index ==dummyNotes.length? 0:_index;
    return Scaffold(
        appBar: AppBar(
          title: Text('Note Viewer'),
        ),
        body:
        Stack(
          children: <Widget>[
            GestureDetector(
              onHorizontalDragEnd: (DragEndDetails details){
                  print('DragEnd details');
                  print(details);
                  if(details.primaryVelocity >0) _nextNote(context);
                  else _previousNote(context);
              },

              onDoubleTap: (){ _editNote(context, _index); },
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width*0.95,
                  //color: Colors.brown,
                  child: ListView(
                    children: <Widget>[
                      Padding( //title pane
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            dummyNotes.length > 0 ? dummyNotes[_index]['title'] : 'Create a New note',
                            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Padding( //Note text box
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                         dummyNotes.length > 0 ? dummyNotes[_index]['text'] : 'No notes to show !',
                          style: TextStyle(
                            fontSize: 24,
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.2,), // extra space when scrolling
                    ],
                  ),
                ),
              ),
            ),
            Padding( // buttons row
              padding: const EdgeInsets.all(10.0),
              child: Align(
                //alignment: FractionalOffset.bottomCenter,
                alignment: Alignment(0.5, 0.9),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    NoteButton('Previous', Colors.amber, (){if(dummyNotes.length>0)_previousNote(context);}),
                    NoteButton('Edit', Colors.grey, (){
                      if(dummyNotes.length>0)
                        _editNote(context, _index);
                      }
                    ),
                    NoteButton('New', Colors.green, (){_newNote(context);}),
                    NoteButton('Next', Colors.amber, (){if(dummyNotes.length>0)_nextNote(context);}),
                  ],
                ),
              ),
            ),
          ],
        )
    );
  }



  Future _previousNote(context) async {
    _decrementIndex();
  }
  Future _nextNote(context) async {
    _incrementIndex();
  }
  void _loadDB() async{
    dummyNotes.addAll( await NoteProvider.getNoteList());
    setState((){});
  }

  Future _editNote(context, passedIndex) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => NoteEditor(_index)));
  }

  Future _newNote(context) async {
    if(dummyNotes.length==0)
      _loadDB();
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
