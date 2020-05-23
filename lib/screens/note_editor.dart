import 'package:designs/providers/note_provider.dart';
import 'package:flutter/material.dart';
import 'note_viewer.dart';
class NoteEditor extends StatefulWidget {
  int index; //use it in state by calling widget.index
  NoteEditor(passedIndex){
    this.index=passedIndex;
  }
  @override
  _NoteEditorState createState() => _NoteEditorState();
}

class _NoteEditorState extends State<NoteEditor> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    _titleController.text= dummyNotes[widget.index]['title'];
    _textController.text= dummyNotes[widget.index]['text'];
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Note'),
        actions: <Widget>[
          FlatButton(
            textColor: Colors.white,
            onPressed: () {_updateNote(context, widget.index);},
            child: Text("Save"),
            shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          ),
        ],
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width*0.85,
          child: ListView(
//            crossAxisAlignment: CrossAxisAlignment.center,
//            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).size.height*0.03,),
              // maybe change TextFields to TextFormFields
              TextField(
                maxLines: 2,
                controller: _titleController,
                decoration: InputDecoration(
                  hintText: 'Title',
                  border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.03,),
              Scrollbar(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  reverse: true,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height*0.45,
                    child: TextField(
                      maxLines: 200,
                      controller: _textController,
                      decoration: InputDecoration(
                        hintText: 'Note text',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  NoteButton('Save', Colors.amber, (){_updateNote(context, widget.index);} ),
                  NoteButton('Discard', Colors.grey, (){_discardNote(context);} ),
                  NoteButton('Delete', Colors.red, (){_deleteNote(context, widget.index);} ),
                ],
              ),
            ],
          ),
        ),
      ),

    );
  }
  Future _updateNote(context, index) async {
    Map note= {'title': _titleController.text , 'text': _textController.text};
    await NoteProvider.updateNoteByData(dummyNotes[index]['title'],dummyNotes[index]['text'],
        {'title': _titleController.text, 'text': _textController.text});
    //dummyNotes.removeAt(index);
    //dummyNotes.insert(index, note);
    dummyNotes[index]=note;
    Navigator.pop(context);
  }
  Future _discardNote(context) async {
    Navigator.pop(context);
  }
  Future _deleteNote(context, index) async {
    await NoteProvider.deleteNoteByData(dummyNotes[index]['title'],dummyNotes[index]['text']);
    dummyNotes.removeAt(index);
    Navigator.pop(context);
  }
}
