// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eproduct.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EProduct _$EProductFromJson(Map<String, dynamic> json) {
  return EProduct(
    categories: (json['categories'] as List)
        ?.map((e) =>
            e == null ? null : Categories.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$EProductToJson(EProduct instance) => <String, dynamic>{
      'categories': instance.categories,
    };
