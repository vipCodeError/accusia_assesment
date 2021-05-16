import 'dart:convert';

List<Tax> employeeFromJson(String str) =>
    List<Tax>.from(json.decode(str).map((x) => Tax.fromJson(x)));

String employeeToJson(List<Tax> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Tax {
  String name;
  String value;
  int product_id;

  Tax({
    this.name,
    this.value,
    this.product_id
  });

  factory Tax.fromJson(Map<String, dynamic> json) => Tax(
      name: json["name"],
      value: json["value"],
      product_id: json['product_id']
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "value" : value,
    "product_id" : product_id
  };
}