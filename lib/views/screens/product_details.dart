import 'package:animate_do/animate_do.dart';
import 'package:e_commerce_ui/data/products_json.dart';
import 'package:e_commerce_ui/models/product.dart';
import 'package:e_commerce_ui/providers/home_provider.dart';
import 'package:e_commerce_ui/providers/product_provider.dart';
import 'package:e_commerce_ui/router/router.dart';
import 'package:e_commerce_ui/views/resources/colors_manager.dart';
import 'package:e_commerce_ui/views/resources/fonts_manager.dart';
import 'package:e_commerce_ui/views/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (Navigator.of(context).canPop()) {
          Navigator.pop(context, "Pop From back arrow");
          Provider.of<ProductProvider>(context, listen: false).imageIndex = 0;
          return Future.value(true);
        } else {
          return Future.value(false);
        }
      },
      child: Scaffold(
        // backgroundColor: ColorsManager.primaryColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(AppSizeManager.s60),
          child: getAppBar(context),
        ),
        body: getBody(context),
        bottomNavigationBar: getBottomNavigationBar(),
      ),
    );
  }

  Widget getAppBar(context) {
    return AppBar(
      // leading
      leading: IconButton(
        onPressed: () {
          Provider.of<ProductProvider>(context, listen: false).imageIndex = 0;
          AppRouter.popRouter();
        },
        icon: Container(
          width: AppSizeManager.s35,
          height: AppSizeManager.s35,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  color: ColorsManager.secondaryColor.withOpacity(0.2))),
          child: const Center(
            child: Icon(Icons.arrow_back_ios_new,
                size: AppSizeManager.s15, color: ColorsManager.secondaryColor),
          ),
        ),
      ),
      title: Text(
        "Product Details",
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: ColorsManager.secondaryColor,
            fontWeight: FontWeightManager.semiBold),
      ),
    );
  }

  Widget getBottomNavigationBar() {
    return Consumer2<ProductProvider, HomeProvider>(
        builder: (context, productProvider, homeProvider, x) {
      return Container(
        height: 85,
        width: double.infinity,
        decoration: const BoxDecoration(
            color: ColorsManager.secondaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            )),
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Text(
              "More",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeightManager.medium,
                  color: Colors.white),
            ),
            Row(
              children: [
                Container(
                  width: 110,
                  height: 35,
                  decoration: BoxDecoration(
                    color: ColorsManager.primaryColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: ColorsManager.whiteColor),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            color: ColorsManager.whiteColor,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: InkWell(
                              onTap: () => productProvider.decrementCounter(),
                              child: const Center(
                                  child: Icon(Icons.remove, size: 20))),
                        ),
                        Text(
                          productProvider.counter.toString(),
                          style: const TextStyle(
                            fontSize: 16,
                            color: ColorsManager.whiteColor,
                            fontWeight: FontWeightManager.medium,
                          ),
                        ),
                        Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            color: ColorsManager.whiteColor,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: InkWell(
                              onTap: () => productProvider.incrementCounter(),
                              child: const Center(
                                  child: Icon(Icons.add, size: 20))),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: AppSizeManager.s18,
                ),
                InkWell(
                  onTap: () {
                    productProvider.addToCart(homeProvider.selectedProduct!);
                  },
                  child: Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorsManager.whiteColor,
                        boxShadow: [
                          BoxShadow(
                            color:
                                ColorsManager.secondaryColor.withOpacity(0.15),
                            blurRadius: 5,
                            offset: const Offset(0, 5),
                          )
                        ]),
                    child: Center(
                        child: Icon(
                      LineIcons.shoppingBag,
                      size: 23,
                    )),
                  ),
                ),
              ],
            )
          ]),
        ),
      );
    });
  }

  Widget getBody(context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Consumer2<ProductProvider, HomeProvider>(
        builder: (context, productProvider, homeProvider, x) {
      return SingleChildScrollView(
        padding: const EdgeInsets.only(left: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: screenHeight * 0.05,
            ),
            Text(
              homeProvider.selectedProduct!.name ?? "null",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                const Icon(
                  LineIcons.star,
                  size: 20,
                  color: ColorsManager.secondaryColor,
                ),
                const SizedBox(
                  width: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Text(
                    "${homeProvider.selectedProduct!.rate ?? "null"} Reviews",
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 15),
                  ),
                  // Icon(LineIcons.shop)
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Text(
                        "\$",
                        style: TextStyle(
                            color: ColorsManager.redColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        homeProvider.selectedProduct!.price ?? 'null',
                        style: const TextStyle(
                          fontSize: 25,
                          color: ColorsManager.secondaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      productProvider
                          .toggleLiked(homeProvider.selectedProduct!);
                      Provider.of<HomeProvider>(context, listen: false)
                          .getFavouriteItems();
                    },
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                          color: ColorsManager.whiteColor,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                color: ColorsManager.secondaryColor
                                    .withOpacity(0.3),
                                blurRadius: 5,
                                offset: const Offset(0, 5))
                          ]),
                      child: Center(
                        child: homeProvider.selectedProduct!.isFavorited
                            ? const Icon(
                                LineIcons.heartAlt,
                                size: 25,
                              )
                            : const Icon(
                                LineIcons.heart,
                                size: 25,
                              ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: screenHeight * 0.06,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                        homeProvider.selectedProduct!.colors!.length, (index) {
                      return FadeIn(
                        duration: Duration(milliseconds: 500 * index),
                        child: InkWell(
                          onTap: () {
                            productProvider.setImageIndex(index);
                            productProvider.selectImage(
                                homeProvider.selectedProduct!.colors![index]);
                          },
                          child: SizedBox(
                            width: 70,
                            height: screenHeight * 0.12,
                            child: Stack(children: [
                              Positioned(
                                top: 10,
                                child: Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                          color: ColorsManager.secondaryColor
                                              .withOpacity(0.12))),
                                ),
                              ),
                              Positioned(
                                top: -10,
                                child: SizedBox(
                                  width: 70,
                                  height: 80,
                                  child: Image.asset(homeProvider
                                      .selectedProduct!.colors![index]),
                                ),
                              ),
                            ]),
                          ),
                        ),
                      );
                    })),
                Flexible(
                  child: FadeInRight(
                    duration: const Duration(milliseconds: 600),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: SizedBox(
                          width: screenWidth / 1.7,
                          height: screenHeight * 0.40,
                          child: Stack(children: [
                            Positioned(
                                top: 40,
                                child: Container(
                                  width: screenWidth / 1.7,
                                  height: screenHeight * 0.35,
                                  decoration: BoxDecoration(
                                      color: ColorsManager.secondaryColor
                                          .withOpacity(0.1),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(80),
                                        topRight: Radius.circular(30),
                                        bottomLeft: Radius.circular(30),
                                        bottomRight: Radius.circular(80),
                                      ),
                                      border: Border.all(
                                          color: ColorsManager.secondaryColor
                                              .withOpacity(0.12))),
                                )),
                            Positioned(
                              // top:-10 ,
                              child: SizedBox(
                                width: screenWidth / 1.7,
                                height: screenHeight * 0.33,
                                child: Image.asset(
                                  homeProvider.selectedProduct!
                                      .colors![productProvider.imageIndex],
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ])),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.03, bottom: 20),
              child: Row(
                children: [
                  SizedBox(
                    width: screenWidth * 0.15,
                    height: 60,
                    child: const Center(
                      child: Text(
                        'Sizes',
                        style: TextStyle(
                          fontWeight: FontWeightManager.medium,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: SizedBox(
                      height: 45,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: sizes.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              productProvider.setSizeIndex(index);
                            },
                            child: Container(
                              margin: const EdgeInsets.only(left: 5, right: 10),
                              width: 45,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: productProvider.sizeIndex == index
                                        ? ColorsManager.secondaryColor
                                        : ColorsManager.secondaryColor
                                            .withOpacity(0.2)),
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Center(
                                child: Text(
                                  sizes[index].toString(),
                                  style: const TextStyle(
                                      color: ColorsManager.secondaryColor,
                                      fontWeight: FontWeightManager.light,
                                      fontSize: 14),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
