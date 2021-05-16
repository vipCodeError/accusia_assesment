import 'package:accusia_assesment/model/variant.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tax.g.dart';

@JsonSerializable()
class Tax{
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;


  Tax({this.name, this.value});

  factory Tax.fromJson(Map<String, dynamic> json) => _$TaxFromJson(json);

  Map<String, dynamic> toJson() => _$TaxToJson(this);
}