import 'package:flutter/material.dart';
import 'package:loginui/finaldata.dart';

class LoginButton extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final Color color, textColor;
  const LoginButton(
      {Key? key,
      required this.text,
      required this.press,
      this.color = loginColor,
      this.textColor = Colors.white})
      : super(key: key);

  get kPrimaryColor => signUpColor;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: newButton(),
      ),
    );
  }

  Widget newButton() {
    return ElevatedButton(
      child: Text(
        text,
        style: TextStyle(color: textColor),
      ),
      onPressed: press,
      style: ElevatedButton.styleFrom(
          primary: color,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          textStyle: TextStyle(
              color: textColor, fontSize: 16, fontWeight: FontWeight.w700)),
    );
  }
}
