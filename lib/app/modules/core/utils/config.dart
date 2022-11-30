import 'package:exceed_resources_frontend/app/modules/core/lang/locale.dart';
import 'package:exceed_resources_frontend/app/modules/core/mock/organization.dart';
import 'package:exceed_resources_frontend/app/modules/core/models/permission_request_response_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

String? directory;
late final MPermissionRequestResponse permissionResponse;
final organization = m_organizations[0];
const minimunLoading = 1500;
const platform = MethodChannel('exceed_resources');
const imgTypes = ['jpg', 'jpeg', 'png'];
final AppThemeData currentTheme = AppThemeData.currentTheme;
final AppLocale locale = AppLocale();
final languages = [
  SvgPicture.asset('assets/icons/english.svg', width: AppSize.icoMd, height: AppSize.icoMd),
  SvgPicture.asset('assets/icons/myanmar.svg', width: AppSize.icoMd, height: AppSize.icoMd),
];

class AppScrollBehaviour extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
