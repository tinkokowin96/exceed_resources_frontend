import 'package:exceed_resources_frontend/app/modules/core/layout/layout.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/misc/controllers/payrise_controller.dart';
import 'package:exceed_resources_frontend/app/modules/misc/widgets/payrise/payrise_card.dart';
import 'package:exceed_resources_frontend/app/modules/misc/widgets/payrise/payrise_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PayriseView extends GetView<PayriseController> {
  const PayriseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppLayout.core(
      currentMenu: EMenu.misc,
      controller: controller,
      title: 'Payrise',
      content: LayoutBuilder(
        builder: (context, constraint) {
          final cardWidth = (constraint.maxWidth - AppSize.sm) / 2;
          return Form(
            key: controller.formKey,
            child: Column(
              children: [
                if (controller.payrises.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(bottom: AppSize.md),
                    child: Wrap(
                      spacing: AppSize.sm,
                      runSpacing: AppSize.sm,
                      children: List.from(
                        controller.payrises.map(
                          (each) => PayriseCard(
                            data: each,
                            width: cardWidth,
                          ),
                        ),
                      ),
                    ),
                  ),
                const PayriseForm(),
              ],
            ),
          );
        },
      ),
    );
  }
}
