import 'package:chewie/chewie.dart';
import 'package:exceed_resources_frontend/app/modules/core/controllers/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class TestController extends AppController {
  final String url;
  TestController({required this.url});

  late final VideoPlayerController playerController = VideoPlayerController.network(url);
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

  @override
  void onClose() {
    playerController.dispose();
    chewieController.dispose();
    super.onClose();
  }
}
