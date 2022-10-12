// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Status _$$_StatusFromJson(Map<String, dynamic> json) => _$_Status(
      id: json['id'] as String,
      text: json['text'] as String,
      color: colorFromJson(json['color'] as String),
    );

Map<String, dynamic> _$$_StatusToJson(_$_Status instance) => <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'color': colorToJson(instance.color),
    };
