import 'package:exceed_resources_frontend/app/modules/core/models/option.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/dropdown/dropdown.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/priority.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/status.dart';
import 'package:flutter/material.dart';

class StatusPriorityDropdown extends StatefulWidget {
  final List<Status>? status;
  final List<Priority>? priority;
  final Status? initialStatus;
  final Priority? initialPriority;
  const StatusPriorityDropdown({
    Key? key,
    this.status,
    this.priority,
    this.initialStatus,
    this.initialPriority,
  }) : super(key: key);

  @override
  State<StatusPriorityDropdown> createState() => _StatusPriorityDropdownState();
}

class _StatusPriorityDropdownState extends State<StatusPriorityDropdown> {
  late final List<Option> _dropdownOptions = List.from(
    (widget.status ?? widget.priority!).map(
      (each) => Option(
        text: (each as dynamic).name,
        value: each,
      ),
    ),
  );
  late dynamic _currentOption = widget.initialStatus ?? widget.initialPriority!;
//   void initState() {
//     print('send.. ${widget.initialStatus} - ${widget.initialPriority}');
//     _currentOption = widget.initialStatus ?? widget.initialPriority!;
//     super.initState();
//   }

  void onDropdownChange(Option? option) {
    if (option != null) {
      setState(() {
        _currentOption = option.value;
      });
    }
  }

  @override
  void didUpdateWidget(StatusPriorityDropdown oldWidget) {
    setState(() {
      _currentOption = widget.initialStatus ?? widget.initialPriority!;
    });
    super.didUpdateWidget(oldWidget);
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
          color: _currentOption.color,
          borderRadius: BorderRadius.circular(AppSize.lg),
        ),
        child: SizedBox(
          width: AppSize.staW,
          height: AppSize.staH,
          child: Center(
            child: Text(
              _currentOption.name,
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
