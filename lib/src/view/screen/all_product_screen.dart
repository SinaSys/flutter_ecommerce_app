import 'package:e_commerce_flutter/core/app_color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../core/app_data.dart';
import '../../controller/product_controller.dart';
import '../widget/product_grid_view.dart';

final ProductController controller = Get.put(ProductController());

class AllProductScreen extends StatelessWidget {
  const AllProductScreen({Key? key}) : super(key: key);

  PreferredSize _appBar(){
    return PreferredSize(
      preferredSize: const Size.fromHeight(100),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.lightGrey),
                child: IconButton(
                  padding: const EdgeInsets.all(8),
                  constraints: const BoxConstraints(),
                  onPressed: () {},
                  icon:
                  const Icon(Icons.ac_unit_outlined, color: Colors.black),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.lightGrey),
                child: IconButton(
                  padding: const EdgeInsets.all(8),
                  constraints: const BoxConstraints(),
                  onPressed: () {},
                  icon: const Icon(Icons.search, color: Colors.black),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _recommendedProductListView(BuildContext context){
    return  SizedBox(
      height: 170,
      child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 10),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: AppData.recommendedProducts.length,
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Container(
                width: 300,
                decoration: BoxDecoration(
                  color: AppData.recommendedProducts[index]
                      .cardBackgroundColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        mainAxisAlignment:
                        MainAxisAlignment.center,
                        children: [
                          Text(
                            '30% OFF DURING \nCOVID 19',
                            style: Theme.of(context)
                                .textTheme
                                .headline3
                                ?.copyWith(color: Colors.white),
                          ),
                          const SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: AppData
                                  .recommendedProducts[index]
                                  .buttonBackgroundColor,
                              elevation: 0,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 18),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(18),
                              ),
                            ),
                            child: Text(
                              "Get Now",
                              style: TextStyle(
                                  color: AppData
                                      .recommendedProducts[index]
                                      .buttonTextColor!),
                            ),
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
                    Image.asset(
                      'assets/images/shopping.png',
                      height: 125,
                      fit: BoxFit.cover,
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }

  Widget _topCategoriesHeader(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Top categories",
            style: Theme.of(context).textTheme.headline4,
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(primary: AppColor.darkOrange),
            child: Text(
              "SEE ALL",
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(color: Colors.deepOrange.withOpacity(0.7)),
            ),
          )
        ],
      ),
    );
  }

  Widget _topCategoriesListView(){
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 5),
            child: GetBuilder<ProductController>(
              builder: (ProductController controller) {
                return Container(
                  width: 50,
                  height: 100,
                  decoration: BoxDecoration(
                    color:
                    controller.categories[index].isSelected ==
                        false
                        ? const Color(0xFFE5E6E8)
                        : const Color(0xFFf16b26),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    icon: FaIcon(controller.categories[index].icon,
                        color: controller
                            .categories[index].isSelected ==
                            false
                            ? const Color(0xFFA6A3A0)
                            : Colors.white),
                    //  onPressed: controller.filterItemsByCategory,
                    onPressed: () =>
                        controller.filterItemsByCategory(index),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _appBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello Sina",
                  style: Theme.of(context).textTheme.headline1,
                ),
                Text(
                  "Lets gets somethings?",
                  style: Theme.of(context).textTheme.headline5,
                ),
                _recommendedProductListView(context),
                _topCategoriesHeader(context),
                _topCategoriesListView(),
                const ProductGridView()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
