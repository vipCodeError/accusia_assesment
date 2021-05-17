import 'dart:convert';

List<ShareCount> employeeFromJson(String str) =>
    List<ShareCount>.from(json.decode(str).map((x) => ShareCount.fromJson(x)));

String employeeToJson(List<ShareCount> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ShareCount {
  int id;
  int share_c;

  ShareCount({
    this.id,
    this.share_c,
  });

  factory ShareCount.fromJson(Map<String, dynamic> json) => ShareCount(
      id: json["id"],
    share_c: json["share_c"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "share_c" : share_c,
  };
}