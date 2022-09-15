import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:flutter/material.dart';

Device getDevice(BuildContext context) => MediaQuery.of(context).size.width <= 576
    ? Device.mobile
    : MediaQuery.of(context).size.width <= 768
        ? Device.tablet
        : Device.desktop;
