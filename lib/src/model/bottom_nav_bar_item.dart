import 'package:e_commerce_flutter/core/app_data.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter/material.dart' show Color, Icon;

@immutable
class BottomNavBarItem {
  final String title;
  final Icon icon;
  final Color activeColor;

  const BottomNavBarItem(
    this.title,
    this.icon, {
    this.activeColor = AppData.lightOrangeColor,
  });
}
