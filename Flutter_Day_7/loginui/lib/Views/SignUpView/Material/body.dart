// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:loginui/Views/LoginView/login_view.dart';
import 'package:loginui/Views/SignUpView/Material/background.dart';
import 'package:loginui/Views/SignUpView/Material/divider.dart';
import 'package:loginui/Views/SignUpView/Material/icon.dart';
import 'package:loginui/Widgets/existing_account.dart';
import 'package:loginui/Widgets/input_field.dart';
import 'package:loginui/Widgets/login_button.dart';
import 'package:loginui/Widgets/password_field.dart';
import 'package:loginui/Widgets/username.dart';
import 'package:lottie/lottie.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "SIGNUP FOR NEW ACCOUNT",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              SizedBox(height: size.height * 0.01),
              Lottie.asset(
                "assets/lottie/53395-SignUp.json",
                height: size.height * 0.35,
              ),
              UserName(
                hintText: "User Name",
                onChanged: (value) {},
              ),
              InputField(
                hintText: "Your Email",
                onChanged: (value) {},
              ),
              PasswordField(
                onChanged: (value) {},
              ),
              LoginButton(
                text: "SIGNUP",
                press: () {},
              ),
              SizedBox(height: size.height * 0.03),
              ExistingAccount(
                login: false,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginView();
                      },
                    ),
                  );
                },
              ),
              DDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SocalIcon(
                    iconSrc: "assets/svg/facebook_f.svg",
                    press: () {},
                  ),
                  SocalIcon(
                    iconSrc: "assets/svg/twitter.svg",
                    press: () {},
                  ),
                  SocalIcon(
                    iconSrc: "assets/svg/google-plus.svg",
                    press: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
