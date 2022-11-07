import 'package:exceed_resources_frontend/app/modules/core/models/option_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/miscs.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/dropdown/dropdown.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/comment_text_model.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CommentInput extends StatelessWidget {
  final List<MOption> colleagueOptions;
  final FocusNode focus;
  final Function(bool hasFocus) onFocusChange;
  final TextEditingController controller;
  final bool dropdown;
  final Function(MOption? value) onDropdownChange;
  final List<MCommentText> messageText;
  final Function(String value)? listenMessage;
  const CommentInput({
    Key? key,
    required this.colleagueOptions,
    required this.focus,
    required this.onFocusChange,
    required this.listenMessage,
    required this.controller,
    required this.dropdown,
    required this.onDropdownChange,
    required this.messageText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        return AppDropdown(
          items: colleagueOptions,
          onChanged: ({checked, value}) => onDropdownChange(value),
          attach: dropdown,
          customSelector: SizedBox(
            width: constraint.maxWidth,
            child: Stack(
              children: [
                SizedBox(
                  width: constraint.maxWidth,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: AppTheme.of(context).color.container, borderRadius: BorderRadius.circular(AppSize.md)),
                    child: Padding(
                      padding: const EdgeInsets.all(AppSize.fepp),
                      child: RichText(
                        text: TextSpan(
                          children: List.from(
                            messageText.map(
                              (each) => TextSpan(
                                text: each.text,
                                style: AppTheme.text(
                                  context: context,
                                  type: each.colleagueId != null ? ETextType.primary : ETextType.body,
                                ),
                                recognizer:
                                    each.colleagueId == null ? null : (TapGestureRecognizer()..onTap = () => ''),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Focus(
                  onFocusChange: onFocusChange,
                  child: TextField(
                    focusNode: focus,
                    controller: controller,
                    onChanged: listenMessage,
                    readOnly: dropdown,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    style: AppTheme.text(context: context).copyWith(color: Colors.transparent),
                    decoration: AppThemeMiscs.inputStyle(context: context, color: EInputColor.transparent),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
