import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class PageTransitionSwitcherWrapper extends StatelessWidget {
  const PageTransitionSwitcherWrapper({
    super.key,
    required this.child,
    this.duration = const Duration(seconds: 1),
  });

  final Widget child;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return PageTransitionSwitcher(
      duration: duration,
      transitionBuilder: (
        Widget child,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) {
        return FadeThroughTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          child: child,
        );
      },
      child: child,
    );
  }
}
