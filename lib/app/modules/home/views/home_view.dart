import 'package:exceed_resources_frontend/app/modules/core/layout/layout.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/button/button.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/carousel.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/button/text_button.dart';
import 'package:exceed_resources_frontend/app/modules/task/controllers/task_table_controller.dart';
import 'package:exceed_resources_frontend/app/modules/task/widgets/task_table.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _controller = Get.find<HomeController>();
  final _tableController = Get.find<TaskTableController>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => _tableController.resetTasks());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppLayout.core(
      header: true,
      currentMenu: EMenu.home,
      content: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSize.md),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppButton(onPressed: _controller.checkInClickHandler, text: 'Check In'),
                AppButton(onPressed: () {}, text: 'Check Out', disabled: true),
                AppButton(onPressed: () {}, text: 'Lunch Break', disabled: true),
              ],
            ),
          ),
          LayoutBuilder(
            builder: (context, carConstraint) {
              return Obx(
                () {
                  return _controller.currentLocation.value == null
                      ? AppCarousel(
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
                          height: AppSize.heH,
                        )
                      : SizedBox(
                          width: carConstraint.maxWidth,
                          height: AppSize.heH,
                          child: GoogleMap(
                            initialCameraPosition: CameraPosition(
                              target: _controller.currentLocation.value!,
                              zoom: 16,
                            ),
                            myLocationButtonEnabled: false,
                            zoomControlsEnabled: false,
                            markers: {
                              Marker(
                                markerId: const MarkerId('current_loc'),
                                position: _controller.currentLocation.value!,
                              )
                            },
                          ),
                        );
                },
              );
            },
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (context, tasConstraint) => Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tasks',
                        style: AppTheme.text(context: context, size: EText.h2, weight: FontWeight.w500),
                      ),
                      AppTextButton(text: 'See All', onPressed: () {}),
                    ],
                  ),
                  const TaskTable()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
