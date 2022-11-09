import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/helper.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/timer.dart';
import 'package:exceed_resources_frontend/app/modules/task/controllers/project_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isTrue = false;
    return Scaffold(
        body: Column(
      children: [
        ColoredBox(
          color: Colors.redAccent,
          child: SizedBox(
            width: 50,
            height: 50,
          ),
        ),
        if (isTrue)
          ColoredBox(
            color: Colors.blueAccent,
            child: SizedBox(
              width: 50,
              height: 50,
            ),
          )
      ],
    ));
  }
}
