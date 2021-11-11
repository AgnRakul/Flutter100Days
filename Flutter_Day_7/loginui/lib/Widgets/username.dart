import 'package:flutter/material.dart';
import 'package:loginui/Widgets/text_field_container.dart';
import 'package:loginui/finaldata.dart';

class UserName extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const UserName(
      {Key? key,
      required this.hintText,
      this.icon = Icons.verified_user_outlined,
      required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextField(
      onChanged: onChanged,
      cursorColor: rPrimaryColor,
      decoration: InputDecoration(
          icon: Icon(
            icon,
            color: rPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none),
    ));
  }
}
