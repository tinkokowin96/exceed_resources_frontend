import 'package:flutter/material.dart';

DateTime dateFromJson(String json) => DateTime.parse(json);

Color colorFromJson(String json) => Color(
      int.parse(
        json.replaceFirst('#', '0xFF'),
      ),
    );

String colorToJson(Color color) => color.toString().replaceAll('Color(', '').replaceAll(')', '');
