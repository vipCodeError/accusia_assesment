// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tax.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tax _$TaxFromJson(Map<String, dynamic> json) {
  return Tax(
    name: json['name'] as String,
    value: json['value'].toString(),
  );
}

Map<String, dynamic> _$TaxToJson(Tax instance) => <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
    };
