import 'package:exceed_resources_frontend/app/modules/chat/widgets/chat/unread_message.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/helper.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/checkbox.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/circle.dart';
import 'package:flutter/material.dart';

class ColleagueItem extends StatefulWidget {
  final String image;
  final int numUnread;
  final String name;
  final String description;
  final bool? selected;
  final Function(bool?)? onChanged;

  final String? salary;
  const ColleagueItem({
    Key? key,
    required this.image,
    required this.name,
    required this.description,
    this.numUnread = 0,
    this.selected,
    this.onChanged,
    this.salary,
  }) : super(key: key);

  @override
  State<ColleagueItem> createState() => _ColleagueItemState();
}

class _ColleagueItemState extends State<ColleagueItem> {
  late bool? _selected = widget.selected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: App.width(context) / 3),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  AppCircle.image(size: AppSize.cSm, image: widget.image),
                  if (widget.numUnread > 0) UnreadMessage(numUnread: widget.numUnread),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: AppSize.sm),
                  child: Text(
                    widget.name,
                    overflow: TextOverflow.ellipsis,
                    style: AppTheme.text(context: context),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(AppSize.md, 0, widget.salary == null ? 0 : AppSize.md, 0),
                  child: Text(
                    widget.description,
                    textAlign: widget.salary == null ? TextAlign.end : TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: AppTheme.text(context: context),
                  ),
                ),
              ),
              if (widget.salary != null)
                Text(
                  widget.salary!,
                  textAlign: TextAlign.end,
                  style: AppTheme.text(context: context),
                ),
              if (widget.selected != null)
                Padding(
                  padding: const EdgeInsets.only(left: AppSize.sm),
                  child: AppCheckbox(
                    selected: _selected!,
                    onChanged: (value) {
                      setState(() => _selected = value);
                      widget.onChanged!(value);
                    },
                  ),
                )
            ],
          ),
        ),
      ],
    );
  }
}
