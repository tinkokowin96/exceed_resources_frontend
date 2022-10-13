import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'status.freezed.dart';
part 'status.g.dart';

@freezed
class Status with _$Status {
  factory Status({
    required String id,
    required String name,
    @JsonKey(
      name: 'color',
      fromJson: colorFromJson,
      toJson: colorToJson,
    )
        required Color color,
  }) = _Status;

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);
}

Color colorFromJson(String json) => Color(int.parse(json));

String colorToJson(Color color) => color.toString().replaceAll('Color(', '').replaceAll(')', '');
