// @dart = 2.9
// Need to Update simple_Animation Package its bit Confusing So i tried on older version
import 'package:flutter/material.dart';
import 'package:fooddeli/pages/start.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Roboto'),
      home: Start(),
    ),
  );
}
