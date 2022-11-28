import 'package:exceed_resources_frontend/app/modules/core/layout/layout.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/animated/animated_press.dart';
import 'package:exceed_resources_frontend/app/modules/misc/controllers/colleague_controller.dart';
import 'package:exceed_resources_frontend/app/modules/misc/widgets/colleague_listing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ColleagueView extends GetView<ColleagueController> {
  const ColleagueView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppLayout.core(
      currentMenu: EMenu.misc,
      controller: controller,
      title: 'Colleagues',
      headerTail: AppAnimatedPress(
        onPressed: () {},
        child: SvgPicture.asset('assets/icons/pay_rise.svg'),
      ),
      content: const ColleagueListing(exportable: true),
    );
  }
}
