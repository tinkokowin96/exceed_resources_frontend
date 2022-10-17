import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:flutter/material.dart';

class QuotationExpend extends StatelessWidget {
  const QuotationExpend({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppSize.md),
      child: Container(
        height: 200,
        color: Colors.amberAccent,
      ),
    );
  }
}
