import 'package:accusia_assesment/model/product.dart';
import 'package:accusia_assesment/model/most_view/ranking_most_view.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ranking_data_most_view.g.dart';

@JsonSerializable()
class RankingDataMostView{

  @JsonKey(name: 'ranking')
  String rankTitle;

  List<MostView> products;

  RankingDataMostView({this.rankTitle, this.products});

  factory RankingDataMostView.fromJson(Map<String, dynamic> json) => _$RankingDataMostViewFromJson(json);

  Map<String, dynamic> toJson() => _$RankingDataMostViewToJson(this);
}