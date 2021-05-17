import 'package:accusia_assesment/model/product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ranking_most_view.g.dart';

@JsonSerializable()
class MostView{

  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'view_count')
  int viewCount;

  MostView({this.id, this.viewCount});

  factory MostView.fromJson(Map<String, dynamic> json) => _$MostViewFromJson(json);

  Map<String, dynamic> toJson() => _$MostViewToJson(this);
}