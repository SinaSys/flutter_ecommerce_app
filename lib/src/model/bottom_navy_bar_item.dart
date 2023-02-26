import 'package:flutter/material.dart' show Icon, Color;

class BottomNavyBarItem {
  String title;
  Icon icon;
  Color activeColor;
  Color inActiveColor;

  BottomNavyBarItem(
    this.title,
    this.icon,
    this.activeColor,
    this.inActiveColor,
  );
}
