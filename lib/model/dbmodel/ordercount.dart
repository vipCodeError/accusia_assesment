import 'dart:convert';

List<OrderCount> employeeFromJson(String str) =>
    List<OrderCount>.from(json.decode(str).map((x) => OrderCount.fromJson(x)));

String employeeToJson(List<OrderCount> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrderCount {
  int id;
  int order_c;

  OrderCount({
    this.id,
    this.order_c,
  });

  factory OrderCount.fromJson(Map<String, dynamic> json) => OrderCount(
    id: json["id"],
    order_c: json["order_c"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "order_c" : order_c,
  };
}