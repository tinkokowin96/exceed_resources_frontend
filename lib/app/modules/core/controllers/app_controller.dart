import 'package:chewie/chewie.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/config.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/drawer.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/popup.dart';
import 'package:exceed_resources_frontend/app/routes/app_pages.dart';
import 'package:exceed_resources_frontend/app/modules/core/extensions/datetime_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:video_player/video_player.dart';

class AppController extends GetxController {
  final stopwatch = Stopwatch();
  final loading = false.obs;
  final adminMode = false.obs;
  final error = Rxn<String>();
  final popup = Rxn<AppPopup>();
  final drawerWidget = Rxn<Widget>();
  final drawer = Rxn<AppDrawer>();
  final confirmCallback = Rxn<Function()>();
  final cancelCallback = Rxn<Function()>();
  DateTime? date;
  DateTimeRange? dateRange;
  VideoPlayerController? playerController;
  ChewieController? chewieController;

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
    loading.refresh();
  }

  void showDatePicker({required TextEditingController controller, bool range = false}) {
    Get.toNamed(AppRoutes.calender, arguments: {
      'picker': !range,
      'rangePicker': range,
      'picked': (dynamic picked) {
        if (range) {
          dateRange = picked;
          controller.text = '${dateRange!.start.formatDate()} - ${dateRange!.end.formatDate()}';
        } else {
          date = picked;
          controller.text = date!.formatDate(short: false);
        }
        Get.back();
      },
    });
  }

  void updateError(String? updatedError) {
    error.value = updatedError;
    error.refresh();
  }

  void showDrawer({required Widget widget}) {
    drawerWidget.value = widget;
    drawer.value = AppDrawer(
      exit: exitDrawer,
      child: widget,
    );
    drawer.refresh();
  }

  void exitDrawer() {
    drawer.value = null;
    drawerWidget.value = null;
    drawer.refresh();
  }

  void exitDrawerRequest() {
    drawer.value = AppDrawer(
      exit: exitDrawer,
      exitDrawerRequest: true,
      child: drawerWidget.value!,
    );
    drawer.refresh();
  }

  void doAysncTask(Function() task) {
    updateLoading(value: true);
    task();
    updateLoading(value: false);
  }

  void toggleMode() {
    adminMode.value = !adminMode.value;
    adminMode.refresh();
  }

  void showPopup({
    required AppPopup popupWidget,
    Function()? confirm,
    Function()? cancel,
  }) {
    popup.value = popupWidget;
    confirmCallback.value = confirm;
    cancelCallback.value = cancel;
    popup.refresh();
  }

  void exitPopup() {
    popup.value = null;
    popup.refresh();
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

  @override
  void onClose() {
    if (chewieController != null) {
      playerController!.dispose();
      chewieController!.dispose();
    }
    super.onClose();
  }
}
