import 'package:cached_network_image/cached_network_image.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/animated/animated_press.dart';
import 'package:exceed_resources_frontend/app/modules/core/models/attachment_field_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/sizebox.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/config.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MessageInput extends StatelessWidget {
  final double width;
  final Function() sendMessage;
  final Function({String? name}) updateAttachment;
  final List<MAttachmentField> attachments;
  final Widget input;
  const MessageInput({
    Key? key,
    required this.width,
    required this.sendMessage,
    required this.updateAttachment,
    required this.attachments,
    required this.input,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          attachments.isNotEmpty
              ? AppContainer(
                  background: AppTheme.of(context).color.secondaryContainer,
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
                                      width: AppSize.msgatt,
                                      height: AppSize.msgatt,
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
                )
              : AppSizeBox.zero,
          Padding(
            padding: const EdgeInsets.only(top: AppSize.sm),
            child: Row(
              children: [
                Expanded(child: input),
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
