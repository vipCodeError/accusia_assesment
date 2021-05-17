import 'dart:convert';

List<ViewCount> employeeFromJson(String str) =>
    List<ViewCount>.from(json.decode(str).map((x) => ViewCount.fromJson(x)));

String employeeToJson(List<ViewCount> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ViewCount {
  int id;
  int view_c;

  ViewCount({
    this.id,
    this.view_c,
  });

  factory ViewCount.fromJson(Map<String, dynamic> json) => ViewCount(
    id: json["id"],
    view_c: json["view_c"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "view_c" : view_c,
  };
}