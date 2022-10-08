import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';

extension ParseMenu on EMenu {
  String getName() => toString().split('.').last;
}
