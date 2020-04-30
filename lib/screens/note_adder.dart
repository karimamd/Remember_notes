import 'package:flutter/material.dart';
import 'note_viewer.dart';
class NoteAdder extends StatefulWidget {
  @override
  _NoteAdderState createState() => _NoteAdderState();
}

class _NoteAdderState extends State<NoteAdder> {
  int _index = 0; // Make sure this is outside build(), otherwise every setState will change the value back to 0

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Note'),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width*0.8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // maybe change TextFields to TextFormFields
              TextField(
                decoration: InputDecoration(
                    hintText: 'Title',
                    border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.03,),
              TextField(
                decoration: InputDecoration(
                    hintText: 'Note text',
                    border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  NoteButton('Save', Colors.amber, (){}),
                  NoteButton('Discard', Colors.grey, (){}),
                ],
              ),
            ],
          ),
        ),
      ),

    );
  }
}
