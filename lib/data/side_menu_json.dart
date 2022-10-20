import 'package:e_commerce_ui/views/screens/cart_page.dart';
import 'package:e_commerce_ui/views/screens/Home/home_page.dart';
import 'package:e_commerce_ui/views/screens/favourite_page.dart';
import 'package:e_commerce_ui/views/screens/order_page.dart';
import 'package:line_icons/line_icons.dart';

List sideMenuItems = [
      {
        "label": "Home",
        "selected": true,
        "icon": LineIcons.home,
        "page": const HomePage()
      },
      {
        "label": "My Cart",
        "selected": false,
        "icon": LineIcons.shoppingCart,
        "page":  const MyCartPage()
      },
      {
        "label": "Favourite",
        "selected": false,
        "icon": LineIcons.heart,
        "page": const FavouritePage()
      },
      {
        "label": "Orders",
        "selected": false,
        "icon": LineIcons.history,
        "page": const OrderPage()
      },
    ];