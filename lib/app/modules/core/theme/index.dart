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
      primary: Colors.black,
      secondary: Colors.orangeAccent,
      secondaryBackground: Color.fromARGB(255, 255, 222, 178),
      background: Colors.white,
      error: Color(0xFFD1512D),
      container: Color(0xFFF9F9F9),
      body: Colors.black,
      category: Color(0xFF8C90F0),
      idle: Color(0xFF565656),
      disabled: Color.fromARGB(120, 86, 86, 86),
    ),
  );

  static AppThemeData darkTheme = AppThemeData(
    color: const AppColor(
      primary: Colors.white,
      secondary: Colors.orangeAccent,
      secondaryBackground: Color.fromARGB(255, 255, 222, 178),
      error: Color(0xFFD1512D),
      container: Colors.black,
      background: Color(0xFF202123),
      body: Colors.white,
      category: Color(0xFF8C90F0),
      idle: Colors.white60,
      disabled: Color.fromARGB(120, 86, 86, 86),
    ),
  );
}
