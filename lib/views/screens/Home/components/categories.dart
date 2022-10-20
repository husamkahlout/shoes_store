import 'package:e_commerce_ui/data/products_json.dart';
import 'package:e_commerce_ui/providers/home_provider.dart';
import 'package:e_commerce_ui/views/resources/colors_manager.dart';
import 'package:e_commerce_ui/views/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Category",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(
          height: AppSizeManager.s15,
        ),
        Row(
          children: [
            SizedBox(
              width: (screenWidth - AppSizeManager.s30) * AppSizeManager.s0_7,
              height: AppSizeManager.s30,
              child:
                  Consumer<HomeProvider>(builder: (context, homeProvider, x) {
                return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: categoryItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                          onTap: () {
                            homeProvider.setCategroyIndex(index);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: AppPaddingManager.p18),
                            child: Container(
                              height: AppSizeManager.s30,
                              decoration: homeProvider.categoryIndex == index
                                  ? const BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color:
                                                  ColorsManager.secondaryColor,
                                              width: AppSizeManager.s1_5)))
                                  : const BoxDecoration(),
                              child: Text(categoryItems[index]["title"],
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                          color: homeProvider.categoryIndex == index
                                              ? ColorsManager.secondaryColor
                                              : ColorsManager.secondaryColor
                                                  .withOpacity(
                                                      AppSizeManager.s0_7))),
                            ),
                          ));
                    });
              }),
            ),
            const SizedBox(
              width: AppSizeManager.s10,
            ),
            Flexible(
              child: Container(
                height: AppSizeManager.s30,
                decoration: BoxDecoration(
                    color: ColorsManager.secondaryColor
                        .withOpacity(AppSizeManager.s0_1),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(AppSizeManager.s4),
                      topRight: Radius.circular(AppSizeManager.s20),
                      bottomLeft: Radius.circular(AppSizeManager.s12),
                      bottomRight: Radius.circular(AppSizeManager.s20),
                    )),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(Icons.search_rounded,
                          size: AppSizeManager.s18),
                      const SizedBox(
                        width: AppSizeManager.s5,
                      ),
                      Text("Search...",
                          style: Theme.of(context).textTheme.bodyMedium)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
