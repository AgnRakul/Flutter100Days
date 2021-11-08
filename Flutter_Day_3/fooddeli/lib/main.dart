// @dart = 2.9
// Need to Update simple_Animation Package its bit Confusing So i tried on older version
import 'package:flutter/material.dart';
import 'package:fooddeli/pages/start.dart';

const List _allAsset = [
  ///tabbar
  'assets/images/Briyani.jpg',
  'assets/images/Chapathi.jpg',
  'assets/images/ChickenRice.jpg',
  'assets/images/EggOmlete.jpg',
  'assets/images/Noodles.jpg',
  'assets/images/starter.jpg'
];


void main() {
  final binding = WidgetsFlutterBinding.ensureInitialized();

  binding.addPostFrameCallback((_) async {
    BuildContext context = binding.renderViewElement;
    if (context != null) {
      for (var asset in _allAsset) {
        precacheImage(AssetImage(asset), context);
      }
    }
  });
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Roboto'),
      home: Start(),
    ),
  );
}
