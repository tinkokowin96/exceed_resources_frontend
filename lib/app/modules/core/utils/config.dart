import 'package:exceed_resources_frontend/app/modules/core/lang/locale.dart';
import 'package:exceed_resources_frontend/app/modules/core/models/permission.dart';
import 'package:exceed_resources_frontend/app/modules/core/models/permission_request_response.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

PermissionRequestResponse? locationPermission;
final AppThemeData currentTheme = AppThemeData.currentTheme;
const minimunLoading = 1500;
final AppLocale locale = AppLocale();
final List<Permission> permissions = [
  Permission(name: 'home', write: true, option: {
    "location": true,
  }),
  Permission(name: 'task', write: true),
  Permission(name: 'chat', write: true),
  Permission(name: 'report', write: false),
  Permission(name: 'misc', write: true),
];

class AppScrollBehaviour extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
