import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/sizebox.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/container.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/project_model.dart';
import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
  final bool active;
  final Function() callback;
  final MProject project;
  const ProjectCard({
    Key? key,
    required this.callback,
    required this.project,
    this.active = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Opacity(
        opacity: active ? 1 : 0.5,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppContainer(
              background: AppTheme.of(context).color.secondary,
              leftRadius: true,
              width: AppSize.pcnW,
              height: AppSize.pcH,
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: AppSize.pccwW,
                        height: AppSize.pccwW,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            DecoratedBox(
                              decoration: BoxDecoration(
                                color: AppTheme.of(context).color.container,
                                borderRadius: BorderRadius.circular(AppSize.pccwW / 2),
                              ),
                              child: const SizedBox(
                                width: AppSize.pccwW,
                                height: AppSize.pccwW,
                              ),
                            ),
                            DecoratedBox(
                              decoration: BoxDecoration(
                                color: Colors.greenAccent,
                                borderRadius: BorderRadius.circular(AppSize.pccW / 2),
                              ),
                              child: const SizedBox(
                                width: AppSize.pccW,
                                height: AppSize.pccW,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: AppSize.md),
                          child: Text(
                            project.phase!.name,
                            overflow: TextOverflow.ellipsis,
                            style: AppTheme.text(
                              context: context,
                              type: ETextType.white,
                              weight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        project.name,
                        overflow: TextOverflow.ellipsis,
                        style: AppTheme.text(
                          context: context,
                          size: EText.h2,
                          type: ETextType.white,
                          weight: FontWeight.w500,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            AppContainer(
              background: AppTheme.of(context).color.secondary.withOpacity(0.1),
              rightRadius: true,
              width: AppSize.pcsW,
              height: AppSize.pcH,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'N',
                      style: AppTheme.text(
                        context: context,
                        size: EText.h4,
                      ).copyWith(
                        color: Colors.greenAccent,
                      ),
                      children: [
                        TextSpan(
                          text: ' - ${project.numNewTask}',
                          style: AppTheme.text(
                            context: context,
                            size: EText.h4,
                          ),
                        )
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'P',
                      style: AppTheme.text(
                        context: context,
                        size: EText.h4,
                      ).copyWith(
                        color: Colors.orangeAccent,
                      ),
                      children: [
                        TextSpan(
                          text: ' - ${project.numProgressTask}',
                          style: AppTheme.text(
                            context: context,
                            size: EText.h4,
                          ),
                        )
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'O',
                      style: AppTheme.text(
                        context: context,
                        size: EText.h4,
                      ).copyWith(
                        color: AppTheme.of(context).color.error,
                      ),
                      children: [
                        TextSpan(
                          text: ' - ${project.numOverdueTask}',
                          style: AppTheme.text(
                            context: context,
                            size: EText.h4,
                          ),
                        )
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'C',
                      style: AppTheme.text(
                        context: context,
                        size: EText.h4,
                      ).copyWith(
                        color: AppTheme.of(context).color.idle,
                      ),
                      children: [
                        TextSpan(
                          text: ' - ${project.numCompletedTask}',
                          style: AppTheme.text(
                            context: context,
                            size: EText.h4,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            AppSizeBox.md,
          ],
        ),
      ),
    );
  }
}
