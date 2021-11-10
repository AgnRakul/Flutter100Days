import 'package:flutter/material.dart';
import 'package:musiclyrics/src/ui/music_list.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const Scaffold(
        body: MusicList(),
      ),
    );
  }
}
