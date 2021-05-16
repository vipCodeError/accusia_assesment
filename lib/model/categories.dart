import 'package:accusia_assesment/model/product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'categories.g.dart';

@JsonSerializable()
class Categories{
  @JsonKey(name: 'id')
  String id;
  @JsonKey(name: 'name')
  String name;

  List<Product> products;


  Categories({
    this.id, this.name, this.products});

  factory Categories.fromJson(Map<String, dynamic> json) => _$CategoriesFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesToJson(this);
}