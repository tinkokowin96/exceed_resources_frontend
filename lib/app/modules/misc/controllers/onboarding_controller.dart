import 'package:chewie/chewie.dart';
import 'package:exceed_resources_frontend/app/modules/core/controllers/app_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/mixins/attachment_mixin.dart';
import 'package:exceed_resources_frontend/app/modules/core/mock/data.dart';
import 'package:exceed_resources_frontend/app/modules/core/mock/onboarding.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:get/get.dart';

class OnboardingController extends AppController with AttachmentMixin {
  final data = m_onbardings.obs;
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
    switch (index) {
      case 0:
        data.value = m_onbardings;
        break;
      case 1:
        data.value = List.from(
          m_onbardings.where(
            (each) => each.attachment != null && each.attachment!.type == EAttachment.video,
          ),
        );
        break;
      case 2:
        data.value = List.from(
          m_onbardings.where(
            (each) => each.attachment != null && each.attachment!.type == EAttachment.image,
          ),
        );
        break;
      case 3:
        data.value = List.from(
          m_onbardings.where(
            (each) => each.attachment != null && each.attachment!.type == EAttachment.pdf,
          ),
        );
        break;
      case 4:
        data.value = List.from(m_onbardings.where((each) => each.article != null));
        break;
      default:
    }
    prevIndex.refresh();
    activeIndex.refresh();
    data.refresh();
  }

  @override
  void onClose() {
    playerController.dispose();
    chewieController.dispose();
    super.onClose();
  }
}
