import 'package:exceed_resources_frontend/app/modules/core/lang/locale.dart';
import 'package:exceed_resources_frontend/app/modules/core/models/permission_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/models/permission_request_response_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

String? directory;
late final MPermissionRequestResponse permissionResponse;
const minimunLoading = 1500;
const platform = MethodChannel('exceed_resources');
const imgTypes = ['jpg', 'jpeg', 'png'];
final AppThemeData currentTheme = AppThemeData.currentTheme;
final AppLocale locale = AppLocale();
final List<MPermission> permissions = [
  MPermission(name: 'home', write: true, option: {
    "location": true,
  }),
  MPermission(name: 'task', write: true),
  MPermission(name: 'chat', write: true),
  MPermission(name: 'report', write: false),
  MPermission(name: 'misc', write: true),
];

class AppScrollBehaviour extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
