import 'dart:io';
import 'package:device_preview_screenshot/device_preview_screenshot.dart';
import 'package:e_commerce_ui/providers/cart_provider.dart';
import 'package:e_commerce_ui/providers/home_provider.dart';
import 'package:e_commerce_ui/providers/product_provider.dart';
import 'package:e_commerce_ui/router/router.dart';
import 'package:e_commerce_ui/views/resources/theme_manager.dart';
import 'package:e_commerce_ui/views/screens/Home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(DevicePreview(
      enabled: true,
      tools: [
        ...DevicePreview.defaultTools,
        DevicePreviewScreenshot(
          onScreenshot: screenshotAsFiles(Directory("assets/ui/")),
        ),
      ],
      builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeProvider>(
            create: (context) => HomeProvider()),
        ChangeNotifierProvider<CartProvider>(
            create: (context) => CartProvider()),
        ChangeNotifierProvider<ProductProvider>(
            create: (context) => ProductProvider()),
      ],
      child: Consumer<HomeProvider>(builder: (context, homeProvider, x) {
        return MaterialApp(
          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          navigatorKey: AppRouter.navKey,
          debugShowCheckedModeBanner: false,
          themeMode: homeProvider.isDark ? ThemeMode.dark : ThemeMode.light,
          theme: getLightTheme(),
          darkTheme: getDarkTheme(),
          home: const HomePage(),
        );
      }),
    );
  }
}
