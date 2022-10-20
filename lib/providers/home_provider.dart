import 'package:e_commerce_ui/data/products_json.dart';
import 'package:e_commerce_ui/models/product.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  HomeProvider() {
    getShoesDetails();
    notifyListeners();
    // log(getFavouriteItems());
  }
// scaffold key
  static GlobalKey<ScaffoldState> scaffolKey = GlobalKey<ScaffoldState>();
// index for category tabs
  int categoryIndex = 0;
  setCategroyIndex(int index) {
    categoryIndex = index;
    notifyListeners();
  }

  Product? selectedProduct;
  getSelectedProduct(Product product) {
    selectedProduct = product;
  }

// shoesList products
  List<Product> productsList = [];
  List<Product> getShoesDetails() {
    productsList = productsJson.map((e) {
      return Product.fromJson(e);
    }).toList();
    return productsList;
  }

  bool isDark = false;
  toggleTheme() {
    isDark = !isDark;
    notifyListeners();
  }

  List<Product> favouriteList = [];
  getFavouriteItems() {
    favouriteList =
        productsList.where((element) => element.isFavorited).toList();
  }
}
