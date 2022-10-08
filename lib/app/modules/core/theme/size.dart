import 'package:exceed_resources_frontend/app/modules/core/utils/helper.dart';
import 'package:flutter/material.dart';

class AppSize {
  static const xs = 6.0;
  static const sm = 10.0;
  static const md = 20.0;
  static const lg = 40.0;

  //icon
  static const icoSm = 18.0;
  static const icoMd = 24.0;
  static const icoLg = 50.0;

  //button
  static const btnWMd = 110.0;
  static const btnHMd = 50.0;

  //popup

  //field
  static fWMd(BuildContext context) => App.width(context) * 0.8;
  static const fHMd = 74.0;

  //dropdown
  static const dH = 120.0;
  static const dL = 100.0; //dropdown loading

  //miscs
  static const fH = 50.0; //footer
  static const aiiw = 16.0; //active indicator item's wrapper
  static const aiii = 8.0; //active indicator item's indicator
}
