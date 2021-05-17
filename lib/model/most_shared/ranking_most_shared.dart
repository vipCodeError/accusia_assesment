import 'package:accusia_assesment/model/product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ranking_most_shared.g.dart';

@JsonSerializable()
class MostShared{

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'shares')
  int mostShares;

  MostShared({this.id, this.mostShares});

  factory MostShared.fromJson(Map<String, dynamic> json) => _$MostSharedFromJson(json);

  Map<String, dynamic> toJson() => _$MostSharedToJson(this);
}