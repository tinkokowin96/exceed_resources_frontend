import 'dart:io';

import 'package:exceed_resources_frontend/app/modules/core/layout/page_header.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AppWebView extends StatefulWidget {
  const AppWebView({Key? key}) : super(key: key);

  @override
  State<AppWebView> createState() => _WebViewState();
}

class _WebViewState extends State<AppWebView> {
  final _url = Get.arguments;

  @override
  void initState() {
    if (Platform.isAndroid) {
      WebView.platform = AndroidWebView();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSize.md),
              child: PageHeader(title: ''),
            ),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraint) {
                  return SizedBox(
                    width: constraint.maxWidth,
                    height: constraint.maxHeight,
                    child: WebView(
                      initialUrl: _url,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
