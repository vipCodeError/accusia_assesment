import 'dart:convert';

List<Categories> employeeFromJson(String str) =>
    List<Categories>.from(json.decode(str).map((x) => Categories.fromJson(x)));

String employeeToJson(List<Categories> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Categories {
  int id;
  String name;

  Categories({
    this.id,
    this.name
  });

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}