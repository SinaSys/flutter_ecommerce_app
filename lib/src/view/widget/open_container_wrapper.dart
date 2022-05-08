import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import '../../model/product.dart';
import '../screen/product_detail_screen.dart';

class OpenContainerWrapper extends StatelessWidget {
  const OpenContainerWrapper(
      {Key? key, required this.child, required this.product})
      : super(key: key);

  final Widget child;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      transitionType: ContainerTransitionType.fade,
      transitionDuration: const Duration(milliseconds: 850),
      closedBuilder: (BuildContext context, VoidCallback openContainer) {
        return InkWell(
          onTap: openContainer,
          child: child,
        );
      },
      openBuilder: (BuildContext context, VoidCallback _) {
        return ProductDetailScreen(product);
      },
    );
  }
}
