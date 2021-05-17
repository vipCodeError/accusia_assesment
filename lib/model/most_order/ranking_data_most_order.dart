import 'package:accusia_assesment/model/most_order/ranking_most_order.dart';
import 'package:accusia_assesment/model/product.dart';
import 'package:accusia_assesment/model/most_view/ranking_most_view.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ranking_data_most_order.g.dart';

@JsonSerializable()
class RankingDataMostOrder{

  @JsonKey(name: 'ranking')
  String rankTitle;

  List<MostOrder> products;

  RankingDataMostOrder({this.rankTitle, this.products});

  factory RankingDataMostOrder.fromJson(Map<String, dynamic> json) => _$RankingDataMostOrderFromJson(json);

  Map<String, dynamic> toJson() => _$RankingDataMostOrderToJson(this);
}