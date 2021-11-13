// ignore_for_file: prefer_const_constructors

import 'package:cryptodata/Src/design/crypto_list.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: Scaffold(
        body: CryptoList(),
      ),
    );
  }
}
