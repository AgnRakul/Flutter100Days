import 'package:flutter/material.dart';
import '/utils/chatItems.dart';
import 'chatscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            final snackBar = SnackBar(
                content: Text("Hey Buddy You Tapped Floating Action Button"));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          backgroundColor: Color(0xffb1d0f0),
          child: Icon(Icons.chat),
        ),
        appBar: AppBar(
          backgroundColor: Color(0xff6394c9),
          centerTitle: true,
          // leading: IconButton(
          //     onPressed: () {
          //       Scaffold.of(context).openDrawer();
          //     },
          //     icon: Icon(
          //       Icons.more_vert,
          //       size: 30,
          //     )),
          title: Text(
            "CHATTERBOX",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          bottom: TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 5.0,
            tabs: [
              Tab(
                text: "CHAT",
              ),
              Tab(
                text: "CALLS",
              ),
            ],
          ),
          actions: [
            IconButton(
                onPressed: () {
                  final snackBar = SnackBar(
                      content: Text("Hey Buddy You Tapped Search Button"));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                icon: Icon(
                  Icons.search,
                  size: 30,
                )),
            const SizedBox(width: 16.0),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: const <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xff6394c9),
                ),
                child: Text(
                  'Profile Name',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.message),
                title: Text('Messages'),
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('Profile'),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
              ),
            ],
          ),
        ),
        body: ListView(
          itemExtent: 80.0,
          children: chatItems,
        ),
      ),
    );
  }
}

class ChatItem extends StatelessWidget {
  final String name;
  final String image;
  final String text;
  final DateTime time;

  const ChatItem({
    Key? key,
    required this.name,
    required this.image,
    required this.text,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: ListTile(
            leading: SizedBox(
              height: 90.0,
              width: 40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(250.0),
                child: Image.network(image, fit: BoxFit.fitHeight),
              ),
            ),
            title: Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(text),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${time.hour}:${time.minute}"),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatScreen(),
                ),
              );
            },
          ),
        ),
        Container(
          color: Colors.grey[300],
          height: 1,
          width: MediaQuery.of(context).size.width - 85.0,
        ),
      ],
    );
  }
}
