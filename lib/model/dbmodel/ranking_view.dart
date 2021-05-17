import 'dart:convert';

List<RankingView> employeeFromJson(String str) =>
    List<RankingView>.from(json.decode(str).map((x) => RankingView.fromJson(x)));

String employeeToJson(List<RankingView> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RankingView {
  int id;
  int view_c;
  String name;

  RankingView({
    this.id,
    this.name,
    this.view_c
  });

  factory RankingView.fromJson(Map<String, dynamic> json) => RankingView(
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