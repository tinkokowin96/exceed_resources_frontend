import 'package:exceed_resources_frontend/app/modules/core/models/dropdown_option.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/dropdown/dropdown.dart';
import 'package:exceed_resources_frontend/app/modules/task/controllers/status_dropdown_controller.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatusDropdown extends StatefulWidget {
  final List<Status> status;
  final Status initialStatus;
  const StatusDropdown({
    Key? key,
    required this.status,
    required this.initialStatus,
  }) : super(key: key);

  @override
  State<StatusDropdown> createState() => _StatusDropdownState();
}

class _StatusDropdownState extends State<StatusDropdown> {
  late final List<DropdownOption> _dropdownOptions = List.from(
    widget.status.map(
      (each) => DropdownOption(
        text: each.text,
        value: each,
      ),
    ),
  );
  late Status _currentStatus = widget.initialStatus;

  void onDropdownChange(DropdownOption? option) {
    if (option != null) {
      setState(() {
        _currentStatus = option.value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppDropdown(
      width: AppSize.staW,
      loading: false,
      items: _dropdownOptions,
      onChanged: ({checked, value}) => onDropdownChange(value),
      dropdownController: TextEditingController(),
      customSelector: DecoratedBox(
        decoration: BoxDecoration(
          color: _currentStatus.color,
          borderRadius: BorderRadius.circular(AppSize.lg),
        ),
        child: SizedBox(
          width: AppSize.staW,
          height: AppSize.staH,
          child: Center(
            child: Text(
              _currentStatus.text,
              style: AppTheme.text(
                context: context,
                size: EText.h5,
                type: ETextType.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
