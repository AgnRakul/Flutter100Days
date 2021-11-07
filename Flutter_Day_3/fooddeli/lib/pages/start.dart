// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:fooddeli/animation/fadeanimation.dart';
import 'package:fooddeli/pages/home.dart';
import 'package:page_transition/page_transition.dart';

class Start extends StatefulWidget {
  Start({Key? key}) : super(key: key);

  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  bool _textVisible = true;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 100));

    _animation =
        Tween<double>(begin: 1.0, end: 25.0).animate(_animationController);

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  void _onTop() {
    setState(() {
      _textVisible = false;
    });

    _animationController.forward().then(
          (value) => Navigator.push(
            context,
            PageTransition(child: Home(), type: PageTransitionType.fade),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/starter.jpg'),
              fit: BoxFit.cover),
        ),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.black.withOpacity(.9),
            Colors.black.withOpacity(.6),
            Colors.black.withOpacity(.2)
          ])),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FadeAnimation(
                  .5,
                  Text(
                    'Food Court',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 60,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                FadeAnimation(
                  .5,
                  Text(
                    'We are Here to Make you Happy...',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        height: 1.4,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                FadeAnimation(
                  1.2,
                  ScaleTransition(
                    scale: _animation,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          colors: [Colors.pink, Colors.orange],
                        ),
                      ),
                      child: AnimatedOpacity(
                        opacity: _textVisible ? 1.0 : 0,
                        duration: Duration(milliseconds: 50),
                        child: MaterialButton(
                          onPressed: () => _onTop(),
                          minWidth: double.infinity,
                          child: Text(
                            "Lets Go",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                FadeAnimation(
                  1.4,
                  AnimatedOpacity(
                    opacity: _textVisible ? 1.0 : 0.0,
                    duration: Duration(milliseconds: 50),
                    child: Align(
                      child: Text("Deliver to Your DoorSteps",
                          style: TextStyle(color: Colors.white, fontSize: 15)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
