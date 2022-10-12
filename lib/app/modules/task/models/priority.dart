import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'priority.freezed.dart';
part 'priority.g.dart';

@freezed
class Priority with _$Priority {
  factory Priority({
    required String id,
    required String text,
    @JsonKey(
      name: 'color',
      fromJson: colorFromJson,
      toJson: colorToJson,
    )
        required Color color,
  }) = _Priority;

  factory Priority.fromJson(Map<String, dynamic> json) => _$PriorityFromJson(json);
}

Color colorFromJson(String json) => Color(int.parse(json));

String colorToJson(Color color) => color.toString().replaceAll('Color(', '').replaceAll(')', '');
