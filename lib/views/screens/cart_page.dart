import 'package:animate_do/animate_do.dart';
import 'package:e_commerce_ui/data/my_cart_json.dart';
import 'package:e_commerce_ui/models/product.dart';
import 'package:e_commerce_ui/providers/cart_provider.dart';
import 'package:e_commerce_ui/providers/home_provider.dart';
import 'package:e_commerce_ui/providers/product_provider.dart';
import 'package:e_commerce_ui/router/router.dart';
import 'package:e_commerce_ui/views/resources/colors_manager.dart';
import 'package:e_commerce_ui/views/resources/fonts_manager.dart';

import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class MyCartPage extends StatelessWidget {
  const MyCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60), child: getAppBar()),
      bottomNavigationBar: getFooter(),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      centerTitle: true,
      title: const Text(
        "My Cart",
        style: TextStyle(
            color: secondary, fontSize: 18, fontWeight: FontWeight.w600),
      ),
      leading: IconButton(
        icon: Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
              color: white,
              shape: BoxShape.circle,
              border: Border.all(color: secondary.withOpacity(0.2))),
          child: const Center(
            child: Icon(
              Icons.arrow_back_ios_new,
              size: 15,
              color: secondary,
            ),
          ),
        ),
        onPressed: () {
          AppRouter.popRouter();
        },
      ),
      elevation: 0,
      backgroundColor: primary,
      actions: [
        Container(
          width: 35,
          height: 35,
          decoration:
              BoxDecoration(color: white, shape: BoxShape.circle, boxShadow: [
            BoxShadow(
                color: secondary.withOpacity(0.15),
                blurRadius: 5,
                offset: const Offset(0, 5))
          ]),
          child: const Center(
            child: Icon(
              LineIcons.shoppingBag,
              size: 20,
              color: secondary,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        )
      ],
    );
  }

  Widget getFooter() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Container(
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
            color: secondary, borderRadius: BorderRadius.circular(12)),
        child: const Center(
          child: Text(
            "Proceed to checkout",
            style: TextStyle(
                color: white, fontSize: 17, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          getCartLits(),
          const SizedBox(
            height: 20,
          ),
          getPromoteCode(),
          const SizedBox(
            height: 40,
          ),
          getSummary()
        ],
      ),
    );
  }

  Widget getCartLits() {
    var size = MediaQuery.of(AppRouter.navKey.currentContext!).size;
    return Consumer2<ProductProvider, HomeProvider>(
        builder: (context, productProvider, homeProvider, x) {
      return Column(
        children: List.generate(productProvider.cartList.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: FadeInLeft(
              duration: Duration(milliseconds: 600 * index),
              child: Row(
                children: [
                  SizedBox(
                    width: (size.width - 30) * 0.7,
                    height: 80,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 70,
                          height: 70,
                          child: Stack(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(productProvider
                                                .cartList[index].image ??
                                            "not defined"),
                                        fit: BoxFit.cover)),
                              ),
                              Positioned(
                                top: 10,
                                child: Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: secondary.withOpacity(0.02)),
                                      color: secondary.withOpacity(0.1)),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                productProvider.cartList[index].name ??
                                    "not defined",
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeightManager.medium),
                                maxLines: 2,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    "\$",
                                    style: TextStyle(
                                        color: red,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    productProvider.cartList[index].price ??
                                        "not defined",
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Flexible(
                    child: Container(
                      height: 80,
                      decoration: const BoxDecoration(
                          // color: secondary
                          ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                productProvider.removeFromCart(
                                    productProvider.cartList[index]);
                              },
                              child: const Align(
                                  alignment: Alignment.topRight,
                                  child: Icon(
                                    Icons.close,
                                    size: 15,
                                  )),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: const [
                                Icon(LineIcons.minusSquare),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "01",
                                  style: TextStyle(fontSize: 14),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(LineIcons.plusSquare)
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }),
      );
    });
  }

  Widget getPromoteCode() {
    var size = MediaQuery.of(AppRouter.navKey.currentContext!).size;
    return Container(
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: secondary.withOpacity(0.3)),
          borderRadius: BorderRadius.circular(12),
          color: secondary.withOpacity(0.05)),
      child: Row(
        children: [
          SizedBox(
            width: (size.width - 30) * 0.7,
            height: 55,
            child: const Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                cursorColor: secondary,
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: "Promo Code"),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(3),
              child: Container(
                height: 55,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8), color: secondary),
                child: const Center(
                  child: Text(
                    "Apply",
                    style: TextStyle(color: white),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getSummary() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              "Subtotal",
              style: TextStyle(
                  color: secondary, fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 2,
            ),
            const Text(
              "(3 items)",
              style: TextStyle(
                color: secondary,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Flexible(
                child: Dash(
                    length: 155,
                    direction: Axis.horizontal,
                    dashLength: 10,
                    dashColor: secondary.withOpacity(0.5))),
            const SizedBox(
              width: 5,
            ),
            const Text(
              "\$600",
              style: TextStyle(
                  color: secondary, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          children: [
            const Text(
              "Delivery charge",
              style: TextStyle(
                  color: secondary, fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 5,
            ),
            Flexible(
                child: Dash(
                    length: 175,
                    direction: Axis.horizontal,
                    dashLength: 10,
                    dashColor: secondary.withOpacity(0.5))),
            const SizedBox(
              width: 5,
            ),
            const Text(
              "Free",
              style: TextStyle(
                  color: secondary, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          children: [
            const Text(
              "Total",
              style: TextStyle(
                  color: secondary, fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 5,
            ),
            Flexible(
                child: Dash(
                    length: 260,
                    direction: Axis.horizontal,
                    dashLength: 10,
                    dashColor: secondary.withOpacity(0.5))),
            const SizedBox(
              width: 5,
            ),
            const Text(
              "\$600",
              style: TextStyle(
                  color: red, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}
