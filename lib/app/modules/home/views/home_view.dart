import 'package:exceed_resources_frontend/app/modules/core/layout/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/button.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/carousel.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/text_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppLayout(
      noHeader: false,
      currentMenu: EMenu.home,
      content: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSize.md),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AppButton(onPressed: () {}, text: 'Check In'),
                AppButton(onPressed: () {}, text: 'Check Out', disabled: true),
                AppButton(onPressed: () {}, text: 'Lunch Break', disabled: true),
              ],
            ),
          ),
          LayoutBuilder(
            builder: (context, carConstraint) => AppCarousel(
              data: [
                Container(
                  width: carConstraint.maxWidth,
                  color: Colors.greenAccent,
                ),
                Container(
                  width: carConstraint.maxWidth,
                  color: Colors.orangeAccent,
                ),
                Container(
                  width: carConstraint.maxWidth,
                  color: Colors.blueAccent,
                ),
              ],
              width: carConstraint.maxWidth,
              height: 220,
            ),
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (context, tasConstraint) => Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: AppSize.sm,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Tasks',
                          style: AppTheme.text(context: context, size: EText.h2, weight: FontWeight.w500),
                        ),
                        AppTextButton(text: 'See All', onPressed: () {})
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
