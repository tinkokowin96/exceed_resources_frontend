import 'dart:io';
import 'package:exceed_resources_frontend/app/modules/core/lang/locale.dart';
import 'package:exceed_resources_frontend/app/modules/core/lang/translation.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/config.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/request_permission.dart';
import 'package:exceed_resources_frontend/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
//   if (permissions.firstWhere((each) => each.name == 'home').option!["location"]) {
//     permissionRequests['location'] = await requestPermission(permission: Permission.location, type: 'Location');
//   }
  if (Platform.isAndroid) {
    permissionRequests['storage'] = await requestPermission(permission: Permission.storage, type: 'Storage');
  }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    currentTheme.addListener(() {
      setState(() {});
    });

    locale.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppTheme(
      child: GetMaterialApp(
        title: 'Application',
        translations: AppTranslation(),
        locale: AppLocale.locale,
        fallbackLocale: const Locale('en', 'US'),
        initialRoute: AppPages.initial,
        getPages: AppPages.routes,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: AppThemeData.currentTheme.color.background,
        ),
      ),
    );
  }
}
