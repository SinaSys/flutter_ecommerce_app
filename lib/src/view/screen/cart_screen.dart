import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_flutter/core/extensions.dart';
import 'package:e_commerce_flutter/src/model/product.dart';
import 'package:e_commerce_flutter/src/view/widget/empty_cart.dart';
import 'package:e_commerce_flutter/src/controller/product_controller.dart';
import 'package:e_commerce_flutter/src/view/animation/animated_switcher_wrapper.dart';

final ProductController controller = Get.put(ProductController());

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      title: Text(
        "My cart",
        style: Theme.of(context).textTheme.displayLarge,
      ),
    );
  }

  Widget cartList() {
    return SingleChildScrollView(
      child: Column(
        children: controller.cartProducts.mapWithIndex((index, _) {
          Product product = controller.cartProducts[index];
          return Container(
            width: double.infinity,
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.grey[200]?.withOpacity(0.6),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorExtension.randomColor,
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Image.asset(
                          product.images[0],
                          width: 100,
                          height: 90,
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name.nextLine,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      controller.getCurrentSize(product),
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      controller.isPriceOff(product)
                          ? "\$${product.off}"
                          : "\$${product.price}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 23,
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        splashRadius: 10.0,
                        onPressed: () =>
                            controller.decreaseItemQuantity(product),
                        icon: const Icon(
                          Icons.remove,
                          color: Color(0xFFEC6813),
                        ),
                      ),
                      GetBuilder<ProductController>(
                        builder: (ProductController controller) {
                          return AnimatedSwitcherWrapper(
                            child: Text(
                              '${controller.cartProducts[index].quantity}',
                              key: ValueKey<int>(
                                controller.cartProducts[index].quantity,
                              ),
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          );
                        },
                      ),
                      IconButton(
                        splashRadius: 10.0,
                        onPressed: () =>
                            controller.increaseItemQuantity(product),
                        icon: const Icon(Icons.add, color: Color(0xFFEC6813)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget bottomBarTitle() {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Total",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
          ),
          Obx(
            () {
              return AnimatedSwitcherWrapper(
                child: Text(
                  "\$${controller.totalPrice.value}",
                  key: ValueKey<int>(controller.totalPrice.value),
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFFEC6813),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }

  Widget bottomBarButton() {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(20)),
          onPressed: controller.isEmptyCart ? null : () {},
          child: const Text("Buy Now"),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    controller.getCartItems();
    return Scaffold(
      appBar: _appBar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: !controller.isEmptyCart ? cartList() : const EmptyCart(),
          ),
          bottomBarTitle(),
          bottomBarButton()
        ],
      ),
    );
  }
}
