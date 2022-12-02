import 'package:exceed_resources_frontend/app/modules/core/layout/page_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AppWebView extends StatelessWidget {
  const AppWebView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            PageHeader(title: Get.arguments['title']),
            Expanded(
              child: WebView(
                initialUrl: Get.arguments['url'],
              ),
            )
          ],
        ),
      ),
    );
  }
}
