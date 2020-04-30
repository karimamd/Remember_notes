import 'package:flutter/material.dart';
import 'note_viewer.dart';
class NoteAdder extends StatefulWidget {
  @override
  _NoteAdderState createState() => _NoteAdderState();
}

class _NoteAdderState extends State<NoteAdder> {
  TextEditingController _titleController= TextEditingController();
  TextEditingController _textController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new Note'),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width*0.85,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
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
              SizedBox(
                height: MediaQuery.of(context).size.height*0.55,
                child: TextField(
                  maxLines: 200,
                  controller: _textController,
                  decoration: InputDecoration(
                      hintText: 'Note text',
                      border: OutlineInputBorder()
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  NoteButton(
                      'Save',
                      Colors.amber,
                      (){_addNote(context,_titleController.text, _textController.text);}
                      ),
                  NoteButton('Discard', Colors.grey, (){_discardNote(context);}),
                ],
              ),
            ],
          ),
        ),
      ),

    );
  }
  Future _addNote(context, noteTitle, noteText) async {
    Map note= {'title': noteTitle , 'text': noteText};
    dummyNotes.insert(0,note);
    Navigator.pop(context);
  }
  Future _discardNote(context) async {
    Navigator.pop(context);
  }
}
