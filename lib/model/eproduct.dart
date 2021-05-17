import 'package:accusia_assesment/model/categories.dart';
import 'package:accusia_assesment/model/most_order/rankings.dart';
import 'package:accusia_assesment/model/most_shared/ranking_data_most_shared.dart';
import 'package:accusia_assesment/model/most_shared/ranking_most_shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'eproduct.g.dart';

@JsonSerializable()
class EProduct{

  List<Categories> categories;
  List<RankingDataMostShared> rankings;

  EProduct({
    this.categories, this.rankings});

  factory EProduct.fromJson(Map<String, dynamic> json) => _$EProductFromJson(json);

  Map<String, dynamic> toJson() => _$EProductToJson(this);
}