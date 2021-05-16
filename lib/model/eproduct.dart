import 'package:accusia_assesment/model/categories.dart';
import 'package:json_annotation/json_annotation.dart';

part 'eproduct.g.dart';

@JsonSerializable()
class EProduct{

  List<Categories> categories;

  EProduct({
    this.categories});

  factory EProduct.fromJson(Map<String, dynamic> json) => _$EProductFromJson(json);

  Map<String, dynamic> toJson() => _$EProductToJson(this);
}