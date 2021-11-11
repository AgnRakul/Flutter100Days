import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loginui/Views/LoginView/login_view.dart';
import 'package:loginui/Views/SignUpView/signup_view.dart';
import 'package:loginui/Views/WelcomeView/Material/background.dart';
import 'package:loginui/Widgets/login_button.dart';
import 'package:loginui/finaldata.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "WELCOME TO XCORE CODE",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          SvgPicture.asset(
            "assets/svg/lady.svg",
            height: size.height * 0.45,
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          LoginButton(
            text: "Login",
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
          LoginButton(
            text: "Sign Up",
            color: signUpColor,
            textColor: Colors.white,
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
          )
        ],
      ),
    ));
  }
}
