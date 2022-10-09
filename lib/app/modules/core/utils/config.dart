import 'package:exceed_resources_frontend/app/modules/core/lang/locale.dart';
import 'package:exceed_resources_frontend/app/modules/core/models/permission_request_response.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

late final PermissionRequestResponse locationPermission;
final AppThemeData currentTheme = AppThemeData.currentTheme;
final AppLocale locale = AppLocale();

class AppScrollBehaviour extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
