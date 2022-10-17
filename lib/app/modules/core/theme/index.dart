import 'package:exceed_resources_frontend/app/modules/core/lang/locale.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/color.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/helper.dart';
import 'package:flutter/material.dart';

class AppTheme extends InheritedWidget {
  final AppColor color = AppThemeData.currentTheme.color;
  final bool isDarkTheme = AppThemeData.isDarkTheme;

  static TextStyle text({
    required BuildContext context,
    EText size = EText.h3,
    ETextType type = ETextType.body,
    FontWeight weight = FontWeight.w400,
    String fontFamily = 'Barlow',
  }) =>
      TextStyle(
        color: getTextColor(type, context),
        fontSize: getFontSize(size, context),
        fontWeight: weight,
        fontFamily: AppLocale.locale.languageCode == 'my' ? 'Notosan' : fontFamily,
      );

  AppTheme({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  static AppTheme of(BuildContext context) {
    final theme = context.dependOnInheritedWidgetOfExactType<AppTheme>();
    if (theme != null) {
      return theme;
    } else {
      throw StateError('Could not find ancestor widget of type `AppTheme`');
    }
  }

  @override
  bool updateShouldNotify(AppTheme oldWidget) => true;
}

class AppThemeData extends ChangeNotifier {
  final AppColor color;

  AppThemeData({required this.color});

  static bool isDarkTheme = false;
  static AppThemeData currentTheme = lightTheme;

  void toggleTheme() {
    isDarkTheme = !isDarkTheme;
    if (isDarkTheme) {
      currentTheme = darkTheme;
    } else {
      currentTheme = lightTheme;
    }
    notifyListeners();
  }

  static AppThemeData lightTheme = AppThemeData(
    color: const AppColor(
      primary: Colors.orangeAccent,
      container: Color(0xFFFAFAFA),
      error: Color(0xFFD1512D),
      background: Colors.white,
      antiFlashWhite: Color(0xFFF3F3F3),
      body: Colors.black,
      idle: Color(0xFF565656),
      disabled: Color(0xFF898989),
      disabledPrimary: Color.fromARGB(120, 255, 172, 64),
    ),
  );

  static AppThemeData darkTheme = AppThemeData(
    color: const AppColor(
      primary: Colors.orangeAccent,
      container: Colors.white24,
      error: Color(0xFFD1512D),
      background: Color(0xFF202123),
      antiFlashWhite: Color(0xFFF3F3F3),
      body: Colors.white,
      idle: Colors.white60,
      disabled: Colors.white38,
      disabledPrimary: Color.fromARGB(120, 255, 171, 64),
    ),
  );
}
