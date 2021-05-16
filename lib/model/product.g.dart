// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product(
    id: json['id'] as String,
    name: json['name'] as String,
    dateAdded: json['date_added"'] as String,
    variants: (json['variants'] as List)
        ?.map((e) =>
            e == null ? null : Variant.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    tax: json['tax'] == null
        ? null
        : Tax.fromJson(json['tax'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'date_added"': instance.dateAdded,
      'variants': instance.variants,
      'tax': instance.tax,
    };
