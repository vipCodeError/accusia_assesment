// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'variant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Variant _$VariantFromJson(Map<String, dynamic> json) {
  return Variant(
    id: json['id'] as String,
    color: json['color'] as String,
    size: json['size"'] as String,
    price: json['price'] as String,
  );
}

Map<String, dynamic> _$VariantToJson(Variant instance) => <String, dynamic>{
      'id': instance.id,
      'color': instance.color,
      'size"': instance.size,
      'price': instance.price,
    };
