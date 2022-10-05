import 'package:exceed_resources_frontend/app/modules/core/layout/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const AppLayout(
      noHeader: false,
    );
  }
}
