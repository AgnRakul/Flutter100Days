// @dart=2.9
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:eventsapps/animation/fadeanimation.dart';
import 'package:eventsapps/events.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _scaleController;
  Animation<double> _scaleAnimation;

  bool hide = false;

  @override
  void initState() {
    super.initState();

    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _scaleAnimation =
        Tween<double>(begin: 1.0, end: 30.0).animate(_scaleController)
          ..addStatusListener(
            (status) {
              if (status == AnimationStatus.completed) {
                Navigator.push(
                  context,
                  PageTransition(
                      child: const Events(), type: PageTransitionType.fade),
                );
              }
            },
          );
  }

  @override
  void dispose() {
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://images.unsplash.com/photo-1513546493312-0066d7de3fd2?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1940&q=80"),
              fit: BoxFit.cover),
        ),
        child: Container(
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(.2),
                Colors.black.withOpacity(.2),
                Colors.black.withOpacity(.2),
                Colors.black.withOpacity(.2)
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FadeAnimation(
                1,
                Text(
                  "Find the best locations near you for a good night.",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      height: 1.1),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              FadeAnimation(
                1.2,
                Text(
                  "Let us find you an event for your interest",
                  style: TextStyle(
                      color: Colors.white.withOpacity(.7),
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 150,
              ),
              FadeAnimation(
                1.4,
                InkWell(
                  onTap: () {
                    setState(
                      () {
                        hide = true;
                      },
                    );
                    _scaleController.forward();
                  },
                  child: AnimatedBuilder(
                    animation: _scaleController,
                    builder: (context, child) => Transform.scale(
                      scale: _scaleAnimation.value,
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.yellow[900]),
                        child: hide == false
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Text(
                                    "Find nearest event",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 17),
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                  )
                                ],
                              )
                            : Container(),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              )
            ],
          ),
        ),
      ),
    );
  }
}
