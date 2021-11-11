import 'package:flutter/material.dart';
import 'package:loginui/Widgets/text_field_container.dart';
import 'package:loginui/finaldata.dart';

class PasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const PasswordField({
    key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        cursorColor: rPrimaryColor,
        decoration: const InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: rPrimaryColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: rPrimaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
