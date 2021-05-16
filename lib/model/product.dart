import 'package:accusia_assesment/model/tax.dart';
import 'package:accusia_assesment/model/variant.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product{
  @JsonKey(name: 'id')
  String id;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'date_added"')
  String dateAdded;

  List<Variant> variants;
  Tax tax;

  Product({
    this.id, this.name, this.dateAdded, this.variants, this.tax});

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}