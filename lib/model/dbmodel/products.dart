import 'dart:convert';

List<Products> employeeFromJson(String str) =>
    List<Products>.from(json.decode(str).map((x) => Products.fromJson(x)));

String employeeToJson(List<Products> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Products {
  int id;
  String name;
  String date;
  String cat_Id;

  Products({
    this.id,
    this.name,
    this.date,
    this.cat_Id
  });

  factory Products.fromJson(Map<String, dynamic> json) => Products(
    id: json["id"],
    name: json["name"],
    date: json["date"],
      cat_Id: json['cat_Id']
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "date" : date,
    "cat_id" : cat_Id
  };
}