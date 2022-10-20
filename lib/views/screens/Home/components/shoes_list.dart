import 'package:animate_do/animate_do.dart';
import 'package:e_commerce_ui/providers/home_provider.dart';
import 'package:e_commerce_ui/router/router.dart';
import 'package:e_commerce_ui/views/resources/colors_manager.dart';
import 'package:e_commerce_ui/views/resources/values_manager.dart';
import 'package:e_commerce_ui/views/screens/product_details.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class ItemsWidget extends StatelessWidget {
  const ItemsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Consumer<HomeProvider>(builder: (context, homeProvider, x) {
      return Wrap(
        spacing: AppSizeManager.s20,
        runSpacing: AppSizeManager.s20,
        children: List.generate(
            homeProvider.productsList.length,
            (index) => Column(
                  children: [
                    InkWell(
                      onTap: () {
                        homeProvider.getSelectedProduct(
                              homeProvider.productsList[index]);
                        AppRouter.navigateToWidget(ProductDetailsPage());
                      },
                      child: FadeIn(
                        duration: Duration(milliseconds: 1000 * index),
                        child: SizedBox(
                          width: (screenWidth - 50) / 2,
                          height: 220,
                          child: Stack(
                            children: [
                              Positioned(
                                top: 20,
                                child: Container(
                                  width: (screenWidth - 50) / 2,
                                  height: 190,
                                  decoration: BoxDecoration(
                                      color: ColorsManager.secondaryColor
                                          .withOpacity(AppSizeManager.s0_1),
                                      borderRadius: BorderRadius.circular(
                                          AppSizeManager.s30)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, right: 15, bottom: 10),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(
                                              LineIcons.star,
                                              size: 18,
                                              color:
                                                  ColorsManager.secondaryColor,
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 2),
                                              child: Text(
                                                homeProvider.productsList[index]
                                                        .rate ??
                                                    "null",
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              // Icon(LineIcons.shop)
                                            )
                                          ],
                                        ),
                                        Container(
                                          width: 35,
                                          height: 35,
                                          decoration: const BoxDecoration(
                                              color: ColorsManager.whiteColor,
                                              shape: BoxShape.circle,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: ColorsManager
                                                      .secondaryColor,
                                                  blurRadius: 5,
                                                  offset: Offset(0, 3),
                                                )
                                              ]),
                                          child: const Center(
                                              child: Icon(
                                            LineIcons.shoppingBag,
                                            size: 18,
                                          )),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: -5,
                                child: SizedBox(
                                  width: (screenWidth - 50) / 2,
                                  height: 180,
                                  child: Image.asset(
                                      homeProvider.productsList[index].image ??
                                          "Null"),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          child: Text(
                            homeProvider.productsList[index].name ?? "null",
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(
                          width: (screenWidth - 60) / 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 3),
                                child: Text(
                                  "\$",
                                  style: TextStyle(
                                      color: ColorsManager.redColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Text(
                                homeProvider.productsList[index].price!,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: ColorsManager.secondaryColor
                                      .withOpacity(0.5),
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                )),
      );
    });
  }
}
