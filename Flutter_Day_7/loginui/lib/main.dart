import 'package:flutter/material.dart';
import 'package:loginui/Views/WelcomeView/welcome_view.dart';
import 'package:loginui/finaldata.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login',
      theme: ThemeData(
          primaryColor: rPrimaryColor, scaffoldBackgroundColor: Colors.white),
      home: const WelcomeView(),
    );
  }
}
