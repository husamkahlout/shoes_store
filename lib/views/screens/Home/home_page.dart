import 'dart:developer';

import 'package:e_commerce_ui/data/ads_json.dart';
import 'package:e_commerce_ui/providers/home_provider.dart';
import 'package:e_commerce_ui/router/router.dart';
import 'package:e_commerce_ui/views/resources/assets_manager.dart';
import 'package:e_commerce_ui/views/resources/colors_manager.dart';
import 'package:e_commerce_ui/views/resources/values_manager.dart';
import 'package:e_commerce_ui/views/screens/Home/components/categories.dart';
import 'package:e_commerce_ui/views/screens/Home/components/custom_slider.dart';
import 'package:e_commerce_ui/views/screens/Home/components/shoes_list.dart';
import 'package:e_commerce_ui/views/screens/Home/components/drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, homeProvider, x) {
      return WillPopScope(
        onWillPop: () {
          if (Navigator.of(context).canPop()) {
            Navigator.pop(context);
            return Future.value(true);
          } else {
            log('cant pop');
            return Future.value(false);
          }
        },
        child: Scaffold(
          key: HomeProvider.scaffolKey,
          drawer: const SideMenu(),
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(AppSizeManager.s60),
            child: getAppBar(),
          ),
          body: getBody(context),
        ),
      );
    });
  }

  Widget getAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      // leading
      leading: IconButton(
        onPressed: () {
          HomeProvider.scaffolKey.currentState?.openDrawer();
        },
        icon: Image.asset(
          AssetsManager.menuSmall,
          color: ColorsManager.secondaryColor,
          width: AppSizeManager.s35,
          // fit: BoxFit.cover,
        ),
      ),
      title: Text(
        "Shoppy",
        style: Theme.of(AppRouter.navKey.currentContext!)
            .textTheme
            .headlineLarge!
            .copyWith(color: ColorsManager.secondaryColor),
      ),
      // actions
      actions: [
        Container(
          margin: const EdgeInsets.only(top: AppSizeManager.s6),
          width: AppSizeManager.s45,
          height: AppSizeManager.s45,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
                color: ColorsManager.secondaryColor
                    .withOpacity(AppSizeManager.s0_5)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(AppPaddingManager.p3),
            child: Container(
              width: AppSizeManager.s45,
              height: AppSizeManager.s45,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(AssetsManager.profileImage),
                  )),
            ),
          ),
        ),
        const SizedBox(
          width: AppSizeManager.s20,
        )
      ],
    );
  }

  Widget getBody(context) {
    return ListView(
      padding: const EdgeInsets.all(AppPaddingManager.p14),
      shrinkWrap: true,
      children: [
        const SizedBox(
          height: AppSizeManager.s10,
        ),
        Text(
          "Hello Husam,",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        Text(
          "Let's get something",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(
          height: AppSizeManager.s10,
        ),
        const CustomSlider(items: adsJson),
        const SizedBox(
          height: AppSizeManager.s14,
        ),
        const CategoriesWidget(),
        const SizedBox(
          height: AppSizeManager.s14,
        ),
        const ItemsWidget(),
      ],
    );
  }
}
