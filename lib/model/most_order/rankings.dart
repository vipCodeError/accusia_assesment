import 'package:accusia_assesment/model/most_order/ranking_data_most_order.dart';
import 'package:accusia_assesment/model/most_shared/ranking_data_most_shared.dart';
import 'package:accusia_assesment/model/most_view/ranking_data_most_view.dart';
import 'package:accusia_assesment/model/most_view/ranking_most_view.dart';
import 'package:accusia_assesment/model/product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rankings.g.dart';

@JsonSerializable()
class Ranking{

  List<RankingDataMostView> mostView;

  Ranking({this.mostView});

  factory Ranking.fromJson(Map<String, dynamic> json) => _$RankingFromJson(json);

  Map<String, dynamic> toJson() => _$RankingToJson(this);
}