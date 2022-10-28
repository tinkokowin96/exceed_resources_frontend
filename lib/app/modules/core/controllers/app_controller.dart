import 'package:exceed_resources_frontend/app/modules/core/utils/config.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/drawer.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/popup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  final stopwatch = Stopwatch();
  final loading = false.obs;
  final error = Rxn<String>();
  final popup = Rxn<AppPopup>();
  final drawerWidget = Rxn<Widget>();
  final drawer = Rxn<AppDrawer>();
  final confirmCallback = Rxn<Function()>();
  final cancelCallback = Rxn<Function()>();

  Future<void> updateLoading({
    required bool value,
    int? elapsed,
  }) async {
    loading.value = value;
    if (elapsed != null) {
      if (elapsed < minimunLoading) {
        await Future.delayed(Duration(milliseconds: minimunLoading - elapsed));
      }
    }
    update();
  }

  void updateError(String? updatedError) {
    error.value = updatedError;
    update();
  }

  void showDrawer({required Widget widget}) {
    drawerWidget.value = widget;
    drawer.value = AppDrawer(
      exit: exitDrawer,
      child: widget,
    );
    update();
  }

  void exitDrawer() {
    drawer.value = null;
    drawerWidget.value = null;
    update();
  }

  void exitDrawerRequest() {
    drawer.value = AppDrawer(
      exit: exitDrawer,
      exitDrawerRequest: true,
      child: drawerWidget.value!,
    );
    update();
  }

  void showPopup({
    required AppPopup popupWidget,
    Function()? confirm,
    Function()? cancel,
  }) {
    popup.value = popupWidget;
    confirmCallback.value = confirm;
    cancelCallback.value = cancel;
    update();
  }

  void exitPopup() {
    popup.value = null;
    update();
  }

  void confirmPopup() {
    exitPopup();
    if (confirmCallback.value != null) {
      confirmCallback.value!();
    }
  }

  void cancelPopup() {
    exitPopup();
    if (cancelCallback.value != null) {
      cancelCallback.value!();
    }
  }
}
