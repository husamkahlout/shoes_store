class Product {
  String? image;
  String? rate;
  String? name;
  String? price;
  bool isFavorited = false;
  List<String>? colors;

  Product(
      {this.image,
      this.rate,
      this.name,
      this.price,
      this.colors,
      this.isFavorited = false});

  Product.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    rate = json['rate'];
    name = json['name'];
    price = json['price'];
    colors = json['colors'].cast<String>();
    isFavorited = false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['rate'] = rate;
    data['name'] = name;
    data['price'] = price;
    data["isFavorited"] = isFavorited == true ? 1 : 0;
    data['colors'] = colors;
    return data;
  }
}
