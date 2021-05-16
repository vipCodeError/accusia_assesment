import 'package:json_annotation/json_annotation.dart';

part 'variant.g.dart';

@JsonSerializable()
class Variant{
  @JsonKey(name: 'id')
  String id;
  @JsonKey(name: 'color')
  String color;
  @JsonKey(name: 'size"')
  String size;
  @JsonKey(name: 'price')
  String price;

  Variant({
    this.id, this.color, this.size, this.price});

  factory Variant.fromJson(Map<String, dynamic> json) => _$VariantFromJson(json);

  Map<String, dynamic> toJson() => _$VariantToJson(this);
}