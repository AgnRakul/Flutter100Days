import 'package:flutter/material.dart';
import 'package:loginui/Views/WelcomeView/Material/body.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
