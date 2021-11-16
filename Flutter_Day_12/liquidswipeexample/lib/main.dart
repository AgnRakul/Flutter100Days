// ignore_for_file: prefer_const_constructors_in_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final pages = [
    SizedBox(
      height: double.infinity,
      child: Image.asset(
        'assets/images/one.jpg',
        fit: BoxFit.cover,
      ),
    ),
    SizedBox(
      height: double.infinity,
      child: Image.asset(
        'assets/images/two.jpg',
        fit: BoxFit.cover,
      ),
    ),
    SizedBox(
      height: double.infinity,
      child: Image.asset(
        'assets/images/three.jpg',
        fit: BoxFit.cover,
      ),
    ),
    SizedBox(
      height: double.infinity,
      child: Image.asset(
        'assets/images/four.jpg',
        fit: BoxFit.cover,
      ),
    ),
    SizedBox(
      height: double.infinity,
      child: Image.asset(
        'assets/images/five.jpg',
        fit: BoxFit.cover,
      ),
    ),
    SizedBox(
      height: double.infinity,
      child: Image.asset(
        'assets/images/six.jpg',
        fit: BoxFit.cover,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          return LiquidSwipe(
            pages: pages,
            fullTransitionValue: 880,
            waveType: WaveType.circularReveal,
            slideIconWidget: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
            positionSlideIcon: .8,
            liquidController: LiquidController(),
          );
        },
      ),
    );
  }
}
