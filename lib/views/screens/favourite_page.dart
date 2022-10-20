import 'package:animate_do/animate_do.dart';
import 'package:e_commerce_ui/providers/home_provider.dart';
import 'package:e_commerce_ui/providers/product_provider.dart';
import 'package:e_commerce_ui/router/router.dart';
import 'package:e_commerce_ui/views/resources/colors_manager.dart';
import 'package:e_commerce_ui/views/screens/product_details.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60), child: getAppBar(context)),
      body: getBody(context),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getAppBar(context) {
    return AppBar(
      title: const Text(
        "Favourite",
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
          Navigator.pop(context);
        },
      ),
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
              LineIcons.alternateTrash,
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

  Widget getBody(context) {
    // List items = [true, true, false, true];
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(15),
      child: Consumer2<HomeProvider, ProductProvider>(
          builder: (context, homeProvider, productProvider, x) {
        return Column(
          children: [
            Wrap(
              spacing: 20,
              runSpacing: 20,
              children:
                  List.generate(homeProvider.favouriteList.length, (index) {
                return InkWell(
                  onTap: () {
                    homeProvider.getSelectedProduct(homeProvider.favouriteList[index]);
                    AppRouter.navigateToWidget(
                        ProductDetailsPage());
                  },
                  child: FadeInDown(
                    duration: Duration(milliseconds: 400 * index),
                    child: Column(
                      children: [
                        SizedBox(
                          width: (size.width - 50) / 2,
                          height: 220,
                          child: Stack(
                            children: [
                              Positioned(
                                top: 20,
                                child: Container(
                                  width: (size.width - 50) / 2,
                                  height: 200,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: homeProvider
                                                  .favouriteList[index]
                                                  .isFavorited
                                              ? 1.2
                                              : 0,
                                          color: homeProvider
                                                  .favouriteList[index]
                                                  .isFavorited
                                              ? secondary.withOpacity(0.5)
                                              : Colors.transparent),
                                      color: secondary.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 10, right: 15, left: 15),
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
                                              size: 20,
                                              color: secondary,
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 3),
                                              child: Text(
                                                homeProvider
                                                        .favouriteList[index]
                                                        .rate ??
                                                    "not defined",
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            )
                                          ],
                                        ),
                                        InkWell(
                                          onTap: () {
                                            productProvider.toggleLiked(
                                                homeProvider
                                                    .favouriteList[index]);
                                            homeProvider.getFavouriteItems();
                                          },
                                          child: Container(
                                            width: 35,
                                            height: 35,
                                            decoration: BoxDecoration(
                                                color: white,
                                                shape: BoxShape.circle,
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: secondary
                                                          .withOpacity(0.15),
                                                      blurRadius: 5,
                                                      offset:
                                                          const Offset(0, 5))
                                                ]),
                                            child: Center(
                                              child: Icon(
                                                homeProvider
                                                        .favouriteList[index]
                                                        .isFavorited
                                                    ? LineIcons.heartAlt
                                                    : LineIcons.heart,
                                                size: 20,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: -10,
                                child: Container(
                                    width: (size.width - 50) / 2,
                                    height: 180,
                                    decoration: const BoxDecoration(),
                                    child: Image.asset(homeProvider
                                            .favouriteList[index].image ??
                                        "null")),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Column(
                          children: [
                            Text(
                              homeProvider.favouriteList[index].name ?? 'null',
                              style: const TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              width: (size.width - 60) / 2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(top: 3),
                                    child: Text(
                                      "\$",
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: red,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 1,
                                  ),
                                  Text(
                                    homeProvider.favouriteList[index].price ??
                                        "null",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: secondary.withOpacity(0.5),
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }),
            ),
          ],
        );
      }),
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
            "Add To Cart",
            style: TextStyle(
                color: white, fontSize: 17, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
