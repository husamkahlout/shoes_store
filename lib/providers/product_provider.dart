import 'package:e_commerce_ui/models/product.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  int imageIndex = 0;
  setImageIndex(int index) {
    imageIndex = index;
    notifyListeners();
  }

  int sizeIndex = 0;
  setSizeIndex(int index) {
    sizeIndex = index;
    notifyListeners();
  }

  int counter = 0;
  incrementCounter() {
    if (counter != 10) {
      counter++;
    }
    notifyListeners();
  }

  decrementCounter() {
    if (counter != 0) {
      counter--;
    }
    notifyListeners();
  }

  toggleLiked(Product product) {
    product.isFavorited = !product.isFavorited;
    notifyListeners();
  }
//=================================================== Cart Functions ========================================

  List<Product> cartList = [];
  String? selectedImage;
  selectImage(String image) {
    selectedImage = image;
  }

  addToCart(Product product) {
    product.image = selectedImage;
    cartList.add(product);
    notifyListeners();
  }

  removeFromCart(Product product) {
    cartList.remove(product);
     notifyListeners();
  }
}
