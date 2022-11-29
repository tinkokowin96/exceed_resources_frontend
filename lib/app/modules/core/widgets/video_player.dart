import 'package:chewie/chewie.dart';
import 'package:exceed_resources_frontend/app/modules/core/controllers/app_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/layout/page_header.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class AppVideoPlayer extends StatelessWidget {
  final String url;
  final String homeRoute;
  final AppController controller;
  final VideoPlayerController? playerController;
  final ChewieController? chewieController;
  const AppVideoPlayer({
    Key? key,
    required this.url,
    required this.homeRoute,
    required this.controller,
    required this.playerController,
    required this.chewieController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const PageHeader(title: ''),
          Expanded(
            child: Center(
              child: SizedBox(
                width: App.width(context),
                child: Chewie(
                  controller: getChewieController(
                    url: url,
                    playerController: playerController,
                    chewieController: chewieController,
                    homeRoute: homeRoute,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
