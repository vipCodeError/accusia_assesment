import 'package:accusia_assesment/model/most_order/ranking_most_order.dart';
import 'package:accusia_assesment/model/most_shared/ranking_most_shared.dart';
import 'package:accusia_assesment/model/product.dart';
import 'package:accusia_assesment/model/most_view/ranking_most_view.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ranking_data_most_shared.g.dart';

@JsonSerializable()
class RankingDataMostShared{

  @JsonKey(name: 'ranking')
  String rankTitle;

  List<dynamic> products;

  RankingDataMostShared({this.rankTitle, this.products});

  factory RankingDataMostShared.fromJson(Map<String, dynamic> json) => _$RankingDataMostSharedFromJson(json);

  Map<String, dynamic> toJson() => _$RankingDataMostSharedToJson(this);
}