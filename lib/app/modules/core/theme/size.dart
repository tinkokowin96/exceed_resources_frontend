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
  static const btnHMd = 46.0;
  static const btnWSm = 90.0;
  static const uubtn = 28.0; //unused button
  static const conimg = 40.0; //conversation image

  //popup

  //input field
  static fWMd(BuildContext context) => App.width(context) * 0.8;
  static const fWSmA = 110.0; //absolute width
  static const fP = 16.0; //field padding
  static const mP = 12.0; //message padding
  static const ma = 80.0;

  //dropdown
  static const dH = 100.0;
  static const dL = 100.0; //dropdown loading

  //active indicator
  static const aiw = 16.0; //wrapper
  static const aii = 8.0; //indicator

  //status
  static const staW = 70.0;
  static const staH = 24.0;

  //miscs
  static const fH = 50.0; //footer height
  static const tcMW = 200.0; //table column max width
  static const heH = 220.0; //home event section height
  static const emp = 35.0; //employee width

  //add button
  static const abtn = 40.0;
  static const abtnIco = 30.0;

  //table
  static const thH = 40.0; //heading height

  //project card
  static const pcW = 200.0;
  static const pcH = 100.0;
  static const pcnW = 150.0;
  static const pcsW = 50.0;
  static const pccwW = 14.0; //project card circle wrapper width
  static const pccW = 12.0;
}
