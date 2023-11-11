import 'package:flutter/material.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: Image.asset('assets/images/empty_cart.png'),
          ),
        ),
        const Text(
          "Empty cart",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        )
      ],
    );
  }
}
