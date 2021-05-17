import 'dart:convert';

List<RankingShare> employeeFromJson(String str) =>
    List<RankingShare>.from(json.decode(str).map((x) => RankingShare.fromJson(x)));

String employeeToJson(List<RankingShare> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RankingShare {
  int id;
  int share_c;
  String name;

  RankingShare({
    this.id,
    this.name,
    this.share_c
  });

  factory RankingShare.fromJson(Map<String, dynamic> json) => RankingShare(
      id: json["id"],
      share_c: json["share_c"],
      name: json['name']
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "share_c" : share_c,
    "name" : name
  };
}