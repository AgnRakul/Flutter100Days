import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loginui/Views/LoginView/Material/background.dart';
import 'package:loginui/Views/SignUpView/signup_view.dart';
import 'package:loginui/Widgets/existing_account.dart';
import 'package:loginui/Widgets/input_field.dart';
import 'package:loginui/Widgets/login_button.dart';
import 'package:loginui/Widgets/password_field.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "LOGIN TO YOUR ACCOUNT",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/svg/login2.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            InputField(
              hintText: "Your Email",
              onChanged: (value) {},
            ),
            PasswordField(
              onChanged: (value) {},
            ),
            LoginButton(
              text: "LOGIN",
              press: () {},
            ),
            SizedBox(height: size.height * 0.03),
            ExistingAccount(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpView();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
