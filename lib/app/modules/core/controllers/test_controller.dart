import 'package:exceed_resources_frontend/app/modules/core/controllers/app_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/models/draggable_item_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestController extends AppController {
  final children = Rx<Map<int, MDraggableItem>>({
    1: MDraggableItem(
      key: 1,
      child: Container(
        color: Colors.amberAccent,
        width: 150,
        height: 150,
      ),
    ),
    2: MDraggableItem(
      key: 2,
      child: Container(
        color: Colors.lightBlueAccent,
        width: 150,
        height: 150,
      ),
    ),
  });

  void dropDraggable(MDraggableItem old, MDraggableItem dropped) {
    children.value[old.key] = MDraggableItem(key: old.key, child: dropped.child);
    children.value[dropped.key] = MDraggableItem(key: dropped.key, child: old.child);
    children.refresh();
  }
//   final String url;
//   TestController({required this.url});

//   late final VideoPlayerController playerController = VideoPlayerController.network(url);
//   late final ChewieController chewieController = ChewieController(
//     videoPlayerController: playerController,
//     startAt: const Duration(seconds: 45),
//     allowFullScreen: false,
//     autoInitialize: true,
//     fullScreenByDefault: true,
//     autoPlay: true,
//     useRootNavigator: true,
//     additionalOptions: (context) => [OptionItem(onTap: () {}, iconData: Icons.chevron_left, title: 'Back')],
//   );

//   @override
//   void onClose() {
//     playerController.dispose();
//     chewieController.dispose();
//     super.onClose();
//   }
}
