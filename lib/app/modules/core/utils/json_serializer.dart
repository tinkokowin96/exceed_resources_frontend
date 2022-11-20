import 'package:flutter/material.dart';

DateTime dateFromJson(String json) => DateTime.parse(json);

String? dateToJson(DateTime? date) => date?.toIso8601String();

Color colorFromJson(String json) => Color(
      int.parse(
        json.replaceFirst('#', '0xFF'),
      ),
    );

String colorToJson(Color color) => color.toString().replaceAll('Color(', '').replaceAll(')', '');

dynamic dataFromJson(String json) {}
