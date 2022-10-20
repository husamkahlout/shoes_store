class OrderModel {
  String? image;
  String? rate;
  String? name;
  String? price;
  List<String>? colors;
  String? date;
  String? time;

  OrderModel(
      {this.image,
      this.rate,
      this.name,
      this.price,
      this.colors,
      this.date,
      this.time});

  OrderModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    rate = json['rate'];
    name = json['name'];
    price = json['price'];
    colors = json['colors'].cast<String>();
    date = json['date'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['rate'] = rate;
    data['name'] = name;
    data['price'] = price;
    data['colors'] = colors;
    data['date'] = date;
    data['time'] = time;
    return data;
  }
}
