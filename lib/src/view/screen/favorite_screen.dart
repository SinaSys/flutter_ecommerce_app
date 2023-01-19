import 'package:flutter/material.dart';
import 'package:e_commerce_flutter/src/view/widget/product_grid_view.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Favorites",
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: ProductGridView(),
      ),
    );
  }
}
