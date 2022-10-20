
import 'package:e_commerce_ui/views/resources/colors_manager.dart';
import 'package:e_commerce_ui/views/resources/fonts_manager.dart';
import 'package:e_commerce_ui/views/resources/styles_manager.dart';
import 'package:e_commerce_ui/views/resources/values_manager.dart';
import 'package:flutter/material.dart';

ThemeData getLightTheme() {
  return ThemeData(
    fontFamily: FontFamilyManager.fontFamily,
    // main colors
    primaryColor: ColorsManager.primaryColor,
    scaffoldBackgroundColor:ColorsManager.primaryColor,
        drawerTheme: const DrawerThemeData(backgroundColor: ColorsManager.primaryColor),

    // cardview theme
    cardTheme: const CardTheme(
      color: ColorsManager.whiteColor,
      // shadowColor: ColorsManager.greyColor,
      // elevation: AppSizeManager.s4,
    ),



    // app bar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: ColorsManager.primaryColor,
      elevation: 0,
      titleTextStyle: getSemiBoldStyle(
          color: ColorsManager.whiteColor, fontSize: FontSizeManager.s16),
    ),




    // button theme
    buttonTheme: const ButtonThemeData(
      shape: StadiumBorder(),
      buttonColor: ColorsManager.primaryColor,
      // splashColor: ColorsManager.lightPrimaryColor,
      // disabledColor: ColorsManager.greyColor,
    ),


    
    // elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      elevation: 0,
      textStyle: getRegularStyle(
          color: ColorsManager.whiteColor, fontSize: FontSizeManager.s17),
      backgroundColor: ColorsManager.primaryColor, 
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizeManager.s12),
      ), 
    )),





    // text theme
    textTheme: TextTheme(
      headlineLarge: getSemiBoldStyle(color: ColorsManager.blackColor, fontSize: FontSizeManager.s22),
      headlineSmall: getRegularStyle(color: ColorsManager.blackColor, fontSize: FontSizeManager.s15,),
      titleLarge: getMediumStyle(color: ColorsManager.blackColor, fontSize: FontSizeManager.s18),
      titleSmall: getRegularStyle(color: ColorsManager.blackColor, fontSize: FontSizeManager.s15),
      bodyMedium: getRegularStyle(color: ColorsManager.secondaryColor, fontSize:FontSizeManager.s13),
    ), 





    // input decoration theme (text form field)


  );
}



ThemeData getDarkTheme() {
  return ThemeData(
    fontFamily: FontFamilyManager.fontFamily,
    drawerTheme: const DrawerThemeData(
      backgroundColor: ColorsManager.secondaryColor
    ),
    // main colors
    primaryColor: ColorsManager.secondaryColor,
    scaffoldBackgroundColor: ColorsManager.secondaryColor,
    // cardview theme
    cardTheme: const CardTheme(
      color: ColorsManager.whiteColor,
      // shadowColor: ColorsManager.greyColor,
    ),

    // app bar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: ColorsManager.secondaryColor,
      elevation: AppSizeManager.s0,
      titleTextStyle: getSemiBoldStyle(
          color: ColorsManager.whiteColor, fontSize: FontSizeManager.s16),
    ),

    // button theme
    buttonTheme: const ButtonThemeData(
      shape: StadiumBorder(),
      buttonColor: ColorsManager.secondaryColor,
      // splashColor: ColorsManager.lightPrimaryColor,
      // disabledColor: ColorsManager.greyColor,
    ),

    // elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      elevation: 0,
      textStyle: getRegularStyle(
          color: ColorsManager.secondaryColor, fontSize: FontSizeManager.s17),
      backgroundColor: ColorsManager.secondaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizeManager.s12),
      ),
    )),

    // text theme
    textTheme: TextTheme(
      headlineLarge: getSemiBoldStyle(
          color: ColorsManager.primaryColor, fontSize: FontSizeManager.s22),
      headlineSmall: getRegularStyle(
        color: ColorsManager.primaryColor,
        fontSize: FontSizeManager.s15,
      ),
      titleLarge: getMediumStyle(
          color: ColorsManager.primaryColor, fontSize: FontSizeManager.s18),
      titleSmall: getRegularStyle(
          color: ColorsManager.primaryColor, fontSize: FontSizeManager.s15),
      bodyMedium: getRegularStyle(
          color: ColorsManager.primaryColor, fontSize: FontSizeManager.s13),
    ),


  );
}
