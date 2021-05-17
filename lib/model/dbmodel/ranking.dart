import 'dart:convert';

List<RankingProduct> employeeFromJson(String str) =>
    List<RankingProduct>.from(json.decode(str).map((x) => RankingProduct.fromJson(x)));

String employeeToJson(List<RankingProduct> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RankingProduct {
  int id;
  int view_c;
  String name;

  RankingProduct({
    this.id,
    this.name,
    this.view_c
  });

  factory RankingProduct.fromJson(Map<String, dynamic> json) => RankingProduct(
      id: json["id"],
      view_c: json["view_c"],
      name: json['name']
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "view_c" : view_c,
    "name" : name
  };
}