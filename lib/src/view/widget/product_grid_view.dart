import 'package:flutter/material.dart';
import 'package:e_commerce_flutter/src/model/product.dart';
import 'package:e_commerce_flutter/src/view/animation/open_container_wrapper.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({
    super.key,
    required this.items,
    required this.isPriceOff,
    required this.likeButtonPressed,
  });

  final List<Product> items;
  final bool Function(Product product) isPriceOff;
  final void Function(int index) likeButtonPressed;

  Widget _gridItemHeader(Product product, int index) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Visibility(
            visible: isPriceOff(product),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              width: 80,
              height: 30,
              alignment: Alignment.center,
              child: const Text(
                "30% OFF",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.favorite,
              color: items[index].isFavorite
                  ? Colors.redAccent
                  : const Color(0xFFA6A3A0),
            ),
            onPressed: () => likeButtonPressed(index),
          ),
        ],
      ),
    );
  }

  Widget _gridItemBody(Product product) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFFE5E6E8),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Image.asset(product.images[0], scale: 3),
    );
  }

  Widget _gridItemFooter(Product product, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 60,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FittedBox(
              child: Text(
                product.name,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Text(
                  product.off != null
                      ? "\$${product.off}"
                      : "\$${product.price}",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(width: 3),
                Visibility(
                  visible: product.off != null ? true : false,
                  child: Text(
                    "\$${product.price}",
                    style: const TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: GridView.builder(
        itemCount: items.length,
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 10 / 16,
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (_, index) {
          Product product = items[index];
          return OpenContainerWrapper(
            product: product,
            child: GridTile(
              header: _gridItemHeader(product, index),
              footer: _gridItemFooter(product, context),
              child: _gridItemBody(product),
            ),
          );
        },
      ),
    );
  }
}
