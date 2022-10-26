import 'package:exceed_resources_frontend/app/modules/core/models/option.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/dropdown/dropdown.dart';
import 'package:exceed_resources_frontend/app/modules/task/components/status_priority.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/priority.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/status.dart';
import 'package:flutter/material.dart';

class StatusPriorityDropdown extends StatefulWidget {
  final List<Status>? statuses;
  final List<Priority>? priorities;
  final Status? initialStatus;
  final Priority? initialPriority;
  const StatusPriorityDropdown({
    Key? key,
    this.statuses,
    this.priorities,
    this.initialStatus,
    this.initialPriority,
  }) : super(key: key);

  @override
  State<StatusPriorityDropdown> createState() => _StatusPriorityDropdownState();
}

class _StatusPriorityDropdownState extends State<StatusPriorityDropdown> {
  late final List<Option> _dropdownOptions = List.from(
    (widget.statuses ?? widget.priorities!).map(
      (each) => Option(
        text: (each as dynamic).name,
        value: each,
      ),
    ),
  );
  late dynamic _currentOption = widget.initialStatus ?? widget.initialPriority!;

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
      items: _dropdownOptions,
      onChanged: ({checked, value}) => onDropdownChange(value),
      dropdownController: TextEditingController(),
      customSelector: StatusPriority(option: _currentOption),
    );
  }
}
