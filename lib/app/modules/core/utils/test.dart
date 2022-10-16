import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/helper.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/form_field.dart';
import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: App.width(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            AppFromField(
              width: 300,
              style: EInputStyle.primary,
              hintText: 'Hint Text',
            )
          ],
        ),
      ),
    );
  }
}
