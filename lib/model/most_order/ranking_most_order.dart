import 'package:accusia_assesment/model/product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ranking_most_order.g.dart';

@JsonSerializable()
class MostOrder{

  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'order_count')
  int orderCount;

  MostOrder({this.id, this.orderCount});

  factory MostOrder.fromJson(Map<String, dynamic> json) => _$MostOrderFromJson(json);

  Map<String, dynamic> toJson() => _$MostOrderToJson(this);
}