import 'package:flutter/material.dart';

class AppRouter {
  static GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

  static navigateToWidget(Widget widget) {
    Navigator.of(navKey.currentContext!)
        .push(MaterialPageRoute(builder: ((context) => widget)));
  }

  static navigateWithReplacementToWidget(Widget widget) {
    Navigator.of(navKey.currentContext!)
        .pushReplacement(MaterialPageRoute(builder: ((context) => widget)));
  }

  static popRouter() {
    Navigator.of(navKey.currentContext!).pop();
  }
}
