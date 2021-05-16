import 'dart:convert';

List<ChildCat> employeeFromJson(String str) =>
    List<ChildCat>.from(json.decode(str).map((x) => ChildCat.fromJson(x)));

String employeeToJson(List<ChildCat> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ChildCat {
  int child_cat;
  int cat_id;

  ChildCat({
    this.child_cat,
    this.cat_id
  });

  factory ChildCat.fromJson(Map<String, dynamic> json) => ChildCat(
      child_cat: json["child_cat"],
      cat_id: json["cat_id"],
  );

  Map<String, dynamic> toJson() => {
    "child_cat": child_cat,
    "cat_id" : cat_id,
  };
}