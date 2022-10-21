import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FullscreenView extends StatelessWidget {
  const FullscreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Get.arguments,
      ),
    );
  }
}
