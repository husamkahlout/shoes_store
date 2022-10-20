class CartModel {
  String? image;
  String? rate;
  String? name;
  String? price;
  List<String>? colors;

  CartModel({this.image, this.rate, this.name, this.price, this.colors});

  CartModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    rate = json['rate'];
    name = json['name'];
    price = json['price'];
    colors = json['colors'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['rate'] = rate;
    data['name'] = name;
    data['price'] = price;
    data['colors'] = colors;
    return data;
  }
}
