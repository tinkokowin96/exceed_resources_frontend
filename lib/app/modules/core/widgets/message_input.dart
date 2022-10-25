import 'package:cached_network_image/cached_network_image.dart';
import 'package:exceed_resources_frontend/app/modules/core/animations/animated_press.dart';
import 'package:exceed_resources_frontend/app/modules/core/models/attachment_field.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/miscs.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/sizebox.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/config.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MessageInput extends StatelessWidget {
  final double width;
  final FocusNode focus;
  final Function(bool hasFocus) onFocusChange;
  final Function() sendMessage;
  final Function() sendAttachment;
  final Function(String value) listenMessage;
  final List<AttachmentField> attachments;
  final TextEditingController controller;
  const MessageInput({
    Key? key,
    required this.width,
    required this.focus,
    required this.onFocusChange,
    required this.sendMessage,
    required this.sendAttachment,
    required this.listenMessage,
    required this.controller,
    required this.attachments,
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
                            (each) => Stack(
                              children: [
                                ColoredBox(
                                  color: AppTheme.of(context).color.idle,
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
                                                  each.name!,
                                                  textAlign: TextAlign.center,
                                                  style: AppTheme.text(
                                                      context: context, size: EText.h4, type: ETextType.white),
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
                                        onPressed: () {},
                                        child: const Icon(
                                          Icons.clear,
                                          size: AppSize.icoSm,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
                  child: Focus(
                    onFocusChange: onFocusChange,
                    child: TextField(
                      focusNode: focus,
                      controller: controller,
                      onChanged: listenMessage,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: AppThemeMiscs.inputStyle(
                        context: context,
                        style: EInputStyle.message,
                        sendAttachment: sendAttachment,
                      ),
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
