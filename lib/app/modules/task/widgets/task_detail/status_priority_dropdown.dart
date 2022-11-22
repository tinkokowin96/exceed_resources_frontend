import 'package:exceed_resources_frontend/app/modules/core/models/option_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/dropdown/dropdown.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/priority_model.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/status_model.dart';
import 'package:exceed_resources_frontend/app/modules/task/widgets/status_priority.dart';
import 'package:flutter/material.dart';

class StatusPriorityDropdown extends StatefulWidget {
  final List<MStatus>? statuses;
  final List<MPriority>? priorities;
  final MStatus? initialStatus;
  final MPriority? initialPriority;
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
  late dynamic _currentOption = widget.initialStatus ?? widget.initialPriority!;
  void onDropdownChange(MOption? option) {
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
      items: List.from(
        (widget.statuses ?? widget.priorities!).map(
          (each) => MOption(
            text: (each as dynamic).name,
            value: each,
          ),
        ),
      ),
      onChanged: ({checked, value}) => onDropdownChange(value),
      customSelector: StatusPriority(option: _currentOption),
    );
  }
}
