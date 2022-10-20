import 'package:animate_do/animate_do.dart';
import 'package:e_commerce_ui/data/side_menu_json.dart';
import 'package:e_commerce_ui/providers/home_provider.dart';
import 'package:e_commerce_ui/views/resources/assets_manager.dart';
import 'package:e_commerce_ui/views/resources/colors_manager.dart';
import 'package:e_commerce_ui/views/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          getHeader(),
          getBody(context),
          getFooter(),
        ],
      ),
    );
  }

  Widget getHeader() {
    return SizedBox(
      height: 160,
      child: DrawerHeader(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                      top: AppSizeManager.s5, bottom: AppSizeManager.s15),
                  height: AppSizeManager.s45,
                  width: AppSizeManager.s45,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(AssetsManager.profileImage),
                      )),
                ),
                Consumer<HomeProvider>(builder: (context, homeProvider, x) {
                  return InkWell(
                    onTap: () => homeProvider.toggleTheme(),
                    child: Container(
                      margin: const EdgeInsets.only(
                          top: AppSizeManager.s5, bottom: AppSizeManager.s15),
                      height: AppSizeManager.s45,
                      width: AppSizeManager.s45,
                      decoration: BoxDecoration(
                          color: ColorsManager.whiteColor,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                color:
                                    ColorsManager.secondaryColor.withOpacity(0.3),
                                blurRadius: 5,
                                offset: const Offset(0, 5))
                          ]),
                      child: Center(
                          child: homeProvider.isDark
                              ? const Icon(
                                  LineIcons.sun,
                                  size: 25,
                                )
                              : const Icon(
                                  LineIcons.moon,
                                  size: 25,
                                )),
                    ),
                  );
                }),
              ],
            ),
            const Text(
              "Hey,",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const Text(
              "Husam",
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  Widget getBody(context) {
    return Column(
      children: List.generate(sideMenuItems.length, (index) {
        if (sideMenuItems[index]["selected"]) {
          return FadeInLeft(
            duration: const Duration(milliseconds: 200),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Container(
                decoration: BoxDecoration(
                    color: ColorsManager.primaryColor,
                    border: Border.all(
                        color: ColorsManager.secondaryColor.withOpacity(0.05)),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: ColorsManager.secondaryColor.withOpacity(0.03),
                        blurRadius: 2.5,
                        offset: const Offset(0, 5),
                      )
                    ]),
                child: ListTile(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  minLeadingWidth: 10,
                  leading: Icon(
                    sideMenuItems[index]["icon"],
                    color: ColorsManager.secondaryColor,
                  ),
                  title: Text(
                    sideMenuItems[index]["label"],
                    style: const TextStyle(
                        fontSize: 16, color: ColorsManager.secondaryColor),
                  ),
                ),
              ),
            ),
          );
        }
        return FadeInLeft(
         duration: Duration(milliseconds: index * 200),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: SizedBox(
              child: ListTile(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return sideMenuItems[index]["page"];
                  }));
                },
                minLeadingWidth: 10,
                leading: Icon(
                  sideMenuItems[index]["icon"],
                  color: ColorsManager.secondaryColor,
                ),
                title: Text(
                  sideMenuItems[index]["label"],
                  style: const TextStyle(
                      fontSize: 16, color: ColorsManager.secondaryColor),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget getFooter() {
    return Column(
      children: [
        const Divider(),
        FadeInLeft(
          duration: const Duration(milliseconds: 800),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: SizedBox(
              child: ListTile(
                minLeadingWidth: 10,
                leading: Icon(
                  LineIcons.alternateSignOut,
                  color: ColorsManager.secondaryColor,
                ),
                title: Text(
                  "Logout",
                  style: TextStyle(
                      fontSize: 16, color: ColorsManager.secondaryColor),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
