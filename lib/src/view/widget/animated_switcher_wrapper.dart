import 'package:flutter/material.dart';

class AnimatedSwitcherWrapper extends StatelessWidget {
  final Widget child;

  const AnimatedSwitcherWrapper({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return ScaleTransition(scale: animation, child: child);
      },
      child: child,
    );
  }
}
