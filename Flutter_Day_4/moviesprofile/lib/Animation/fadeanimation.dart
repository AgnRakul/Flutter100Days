// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeAnimation(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track("opacity")
          .add(Duration(milliseconds: 500), Tween(begin: 0.0, end: 1.0)),
      Track("translateY").add(
          Duration(milliseconds: 500), Tween(begin: 130.0, end: 0.0),
          curve: Curves.easeOut)
    ]);

    return ControlledAnimation(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builderWithChild: (context, child, animation) => Opacity(
        opacity: (animation as Map)["opacity"],
        child: Transform.translate(
            offset: Offset(0, animation["translateY"]), child: child),
      ),
    );
  }
}
