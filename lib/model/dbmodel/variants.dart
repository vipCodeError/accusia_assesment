import 'dart:convert';

List<Variants> employeeFromJson(String str) =>
    List<Variants>.from(json.decode(str).map((x) => Variants.fromJson(x)));

String employeeToJson(List<Variants> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Variants {
  int id;
  String color;
  String size;
  int price;
  int product_id;

  Variants({
    this.id,
    this.color,
    this.size,
    this.price,
    this.product_id
  });

  factory Variants.fromJson(Map<String, dynamic> json) => Variants(
      id: json["id"],
      color: json["color"],
      size: json["size"],
      price: json["price"],
      product_id: json['product_id']
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "color": color,
    "size" : size,
    "price" : price,
    "product_id" : product_id
  };
}