import 'dart:math';
import 'package:flutter/material.dart';
import 'app_data.dart';


extension ColorExtension on Color {
  static Color get randomColor {
    Random random = Random();
    int randNumber = random.nextInt(AppData.randomColors.length);
    return AppData.randomColors[randNumber];
  }
}


extension IterableExtension<T> on Iterable<T> {
  Iterable<T> distinctBy(Object Function(T e) getCompareValue) {
    var result = <T>[];
    forEach((element) {
      if (!result.any((x) => getCompareValue(x) == getCompareValue(element))) {
        result.add(element);
      }
    });
    return result;
  }
}
