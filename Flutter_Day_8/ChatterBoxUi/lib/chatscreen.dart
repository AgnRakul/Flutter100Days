import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("Martha"),
        backgroundColor: Color(0xff6394c9),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {
                final snackBar = SnackBar(
                  content: Text("Trying to Make a Call"),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              icon: Icon(
                Icons.call,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        reverse: false,
        child: Container(
          child: inputBar,
        ),
      ),
    );
  }
}

final roundedContainer = ClipRRect(
  borderRadius: BorderRadius.circular(20.0),
  child: Container(
    color: Colors.white,
    child: Row(
      children: <Widget>[
        SizedBox(width: 8.0),
        Icon(Icons.insert_emoticon, size: 30.0),
        SizedBox(width: 8.0),
        Expanded(
          child: TextField(
            decoration: const InputDecoration(
              hintText: 'Type a message',
              border: InputBorder.none,
            ),
            autofocus: false,
            minLines: 1,
            maxLines: 5,
            keyboardType: TextInputType.multiline,
          ),
        ),
        Icon(
          Icons.attach_file,
          size: 30.0,
          color: Color(0xff6394c9),
        ),
        SizedBox(width: 8.0),
        Icon(Icons.camera_alt, size: 30.0),
        SizedBox(width: 8.0),
      ],
    ),
  ),
);

final inputBar = Padding(
  padding: EdgeInsets.only(top: 680, left: 10, right: 10),
  child: Row(
    children: <Widget>[
      Expanded(
        child: roundedContainer,
      ),
      SizedBox(
        width: 5.0,
      ),
      GestureDetector(
        onTap: () {},
        child: CircleAvatar(
          child: Icon(Icons.send),
        ),
      ),
    ],
  ),
);
