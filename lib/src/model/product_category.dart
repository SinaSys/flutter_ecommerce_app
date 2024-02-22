import 'package:e_commerce_flutter/src/model/product.dart';
import 'package:flutter/material.dart' show IconData;

class ProductCategory {
  ProductType type;
  bool isSelected;
  IconData icon;

  ProductCategory({
    required this.type,
    this.isSelected = false,
    required this.icon,
  });
}
