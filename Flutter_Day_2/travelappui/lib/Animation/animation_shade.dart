// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

enum AniProps { opacity, translateY }

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeAnimation(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    var tween = TimelineTween<AniProps>()
      ..addScene(
              begin: Duration(milliseconds: 0),
              end: Duration(milliseconds: 500))
          .animate(
        AniProps.opacity,
        tween: Tween(begin: 120, end: 0.0),
      )
      ..addScene(
              begin: Duration(milliseconds: 0),
              end: Duration(milliseconds: 500))
          .animate(
        AniProps.translateY,
        tween: Tween(begin: 120, end: 0.0),
      );

    return CustomAnimation(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builder: (context, child, animation) => Opacity(
        opacity: 1, // Need to fix
        child: Transform.translate(
          offset: Offset(0, 1), // Need to fix
          child: child,
        ),
      ),
    );
  }
}
