import 'dart:math' show Random;
import 'package:flutter/material.dart' show Color;
import 'package:e_commerce_flutter/core/app_data.dart';

extension ColorExtension on Color {
  static Color get randomColor {
    Random random = Random();
    int randNumber = random.nextInt(AppData.randomColors.length);
    return AppData.randomColors[randNumber];
  }
}

extension IterableExtension<T> on Iterable<T> {
  Iterable<E> mapWithIndex<E>(E Function(int index, T value) f) {
    return Iterable.generate(length).map((i) => f(i, elementAt(i)));
  }
}

extension StringExtension on String {
  String get nextLine {
    if (length < 15) {
      return this;
    } else {
      return "${substring(0, 15)} \n${substring(15, length)}";
    }
  }
}
