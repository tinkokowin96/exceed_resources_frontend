import 'package:chewie/chewie.dart';
import 'package:exceed_resources_frontend/app/modules/core/controllers/app_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/mock/data.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:get/get.dart';

class OnboardingController extends AppController {
  late final VideoPlayerController playerController = VideoPlayerController.network(asset_data[4]);
  late final ChewieController chewieController = ChewieController(
    videoPlayerController: playerController,
    startAt: const Duration(seconds: 45),
    allowFullScreen: false,
    autoInitialize: true,
    fullScreenByDefault: true,
    autoPlay: true,
    useRootNavigator: true,
    additionalOptions: (context) => [OptionItem(onTap: () {}, iconData: Icons.chevron_left, title: 'Back')],
  );
  final activeIndex = 0.obs;
  final prevIndex = 0.obs;

  void updateIndex(int index) {
    prevIndex.value = activeIndex.value;
    activeIndex.value = index;
    prevIndex.refresh();
    activeIndex.refresh();
  }

  @override
  void onClose() {
    playerController.dispose();
    chewieController.dispose();
    super.onClose();
  }
}
