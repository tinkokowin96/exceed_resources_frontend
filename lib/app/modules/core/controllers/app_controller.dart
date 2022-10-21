import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  final loading = false.obs;
  final popup = Rxn<Widget>();
  final confirmCallback = Rxn<Function()>();
  final cancelCallback = Rxn<Function()>();

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

  void showPopup({
    required Widget popupWidget,
    Function()? confirm,
    Function()? cancel,
  }) {
    popup.value = popupWidget;
    confirmCallback.value = confirm;
    cancelCallback.value = cancel;
    update();
  }
}
