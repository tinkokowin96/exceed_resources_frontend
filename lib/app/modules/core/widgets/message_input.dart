import 'package:cached_network_image/cached_network_image.dart';
import 'package:exceed_resources_frontend/app/modules/core/animations/animated_press.dart';
import 'package:exceed_resources_frontend/app/modules/core/models/attachment_field_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/models/option_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/miscs.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/sizebox.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/config.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/dropdown/dropdown.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/comment_type_model.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MessageInput extends StatelessWidget {
  final double width;
  final List<MOption> employeeOptions;
  final FocusNode focus;
  final Function(bool hasFocus) onFocusChange;
  final Function() sendMessage;
  final Function({String? name}) updateAttachment;
  final Function(String value) listenMessage;
  final List<MAttachmentField> attachments;
  final TextEditingController controller;
  final bool dropdown;
  final Function(MOption? value) onDropdownChange;
  final List<MCommentType> messageText;
  const MessageInput({
    Key? key,
    required this.width,
    required this.employeeOptions,
    required this.focus,
    required this.onFocusChange,
    required this.sendMessage,
    required this.updateAttachment,
    required this.listenMessage,
    required this.controller,
    required this.attachments,
    required this.dropdown,
    required this.onDropdownChange,
    required this.messageText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          attachments.isNotEmpty
              ? ColoredBox(
                  color: AppTheme.of(context).color.container,
                  child: Padding(
                    padding: const EdgeInsets.all(AppSize.sm),
                    child: SizedBox(
                      width: width,
                      child: Wrap(
                        spacing: AppSize.xs,
                        runSpacing: AppSize.xs,
                        children: List.from(
                          attachments.map(
                            (each) => !each.delete
                                ? Stack(
                                    children: [
                                      ColoredBox(
                                        color: AppTheme.of(context).color.background,
                                        child: SizedBox(
                                          width: AppSize.ma,
                                          height: AppSize.ma,
                                          child: imgTypes.contains(each.type) && each.file != null
                                              ? Image.file(
                                                  each.file!,
                                                  fit: BoxFit.cover,
                                                )
                                              : imgTypes.contains(each.type) && each.value != null
                                                  ? CachedNetworkImage(imageUrl: each.value!)
                                                  : Center(
                                                      child: Text(
                                                        each.name,
                                                        textAlign: TextAlign.center,
                                                        style: AppTheme.text(context: context, size: EText.h4),
                                                      ),
                                                    ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 0,
                                        right: 0,
                                        child: ColoredBox(
                                          color: AppTheme.of(context).color.container.withOpacity(0.5),
                                          child: SizedBox(
                                            child: AppAnimatedPress(
                                              onPressed: () => updateAttachment(name: each.name),
                                              child: const Icon(
                                                Icons.clear,
                                                size: AppSize.icoSm,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                : AppSizeBox.zero,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : AppSizeBox.zero,
          Padding(
            padding: const EdgeInsets.only(top: AppSize.sm),
            child: Row(
              children: [
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraint) {
                      return AppDropdown(
                        width: constraint.maxWidth,
                        items: employeeOptions,
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
                                      color: AppTheme.of(context).color.container,
                                      borderRadius: BorderRadius.circular(AppSize.md)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(AppSize.mP),
                                    child: RichText(
                                      text: TextSpan(
                                        children: List.from(
                                          messageText.map(
                                            (each) => TextSpan(
                                              text: each.text,
                                              style: AppTheme.text(
                                                context: context,
                                                type: each.employeeId != null ? ETextType.primary : ETextType.body,
                                              ),
                                              recognizer: each.employeeId == null
                                                  ? null
                                                  : (TapGestureRecognizer()..onTap = () => ''),
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
                                  //   style: AppTheme.text(context: context).copyWith(color: Colors.red),
                                  style: AppTheme.text(context: context).copyWith(color: Colors.transparent),
                                  decoration: AppThemeMiscs.inputStyle(
                                    context: context,
                                    style: EInputStyle.message,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: AppSize.sm),
                  child: AppAnimatedPress(
                    onPressed: updateAttachment,
                    child: Icon(
                      Icons.attach_file,
                      color: AppTheme.of(context).color.idle,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: AppSize.sm),
                  child: AppAnimatedPress(
                    onPressed: sendMessage,
                    child: SvgPicture.asset(
                      'assets/icons/send.svg',
                      color: AppTheme.of(context).color.secondary,
                      width: 40,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
