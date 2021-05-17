import 'dart:convert';

List<RankingOrder> employeeFromJson(String str) =>
    List<RankingOrder>.from(json.decode(str).map((x) => RankingOrder.fromJson(x)));

String employeeToJson(List<RankingOrder> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RankingOrder {
  int id;
  int order_c;
  String name;

  RankingOrder({
    this.id,
    this.name,
    this.order_c
  });

  factory RankingOrder.fromJson(Map<String, dynamic> json) => RankingOrder(
      id: json["id"],
      order_c: json["order_c"],
      name: json['name']
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "order_c" : order_c,
    "name" : name
  };
}