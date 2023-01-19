import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:e_commerce_flutter/core/app_data.dart';
import 'package:e_commerce_flutter/src/view/screen/cart_screen.dart';
import 'package:e_commerce_flutter/src/view/screen/profile_screen.dart';
import 'package:e_commerce_flutter/src/view/screen/favorite_screen.dart';
import 'package:e_commerce_flutter/src/controller/product_controller.dart';
import 'package:e_commerce_flutter/src/view/screen/all_product_screen.dart';

final ProductController controller = Get.put(ProductController());

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const List<Widget> screens = [
    AllProductScreen(),
    FavoriteScreen(),
    CartScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () {
          return BottomNavyBar(
            itemCornerRadius: 10,
            selectedIndex: controller.currentBottomNavItemIndex.value,
            items: AppData.bottomNavyBarItems
                .map((item) => BottomNavyBarItem(
                    icon: item.icon,
                    title: Text(item.title),
                    activeColor: item.activeColor,
                    inactiveColor: item.inActiveColor))
                .toList(),
            onItemSelected: controller.switchBetweenBottomNavigationItems,
          );
        },
      ),
      body: Obx(() {
        return PageTransitionSwitcher(
          duration: const Duration(seconds: 1),
          transitionBuilder: (
            Widget child,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return FadeThroughTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              child: child,
            );
          },
          child: screens[controller.currentBottomNavItemIndex.value],
        );
      }),
    );
  }
}
