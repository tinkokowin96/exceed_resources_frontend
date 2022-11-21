import 'package:cached_network_image/cached_network_image.dart';
import 'package:exceed_resources_frontend/app/modules/core/layout/layout.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/carousel.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/circle.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/column.dart';
import 'package:exceed_resources_frontend/app/modules/misc/controllers/article_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ArticleView extends GetView<ArticleController> {
  const ArticleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppLayout.core(
      currentMenu: EMenu.misc,
      title: controller.article.title,
      controller: controller,
      content: LayoutBuilder(builder: (context, constraint) {
        return SingleChildScrollView(
          child: AppColumn(
            spacing: AppSize.sm,
            children: List.from(
              controller.article.sections.map(
                (each) {
                  switch (each.type) {
                    case EDynamicField.title:
                      return Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(top: AppSize.sm),
                          child: Text(
                            each.data[0],
                            style: AppTheme.text(
                              context: context,
                              size: EText.h2,
                              weight: FontWeight.w500,
                            ),
                          ),
                        ),
                      );
                    case EDynamicField.body:
                      return Text(
                        each.data[0],
                        style: AppTheme.text(context: context),
                      );
                    case EDynamicField.image:
                      return CachedNetworkImage(
                        imageUrl: each.data[0],
                        width: constraint.maxWidth,
                      );
                    case EDynamicField.unordered:
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: List.from(
                          each.data.map(
                            (item) => ListTile(
                              leading: AppCircle.container(
                                width: 6,
                                color: AppTheme.of(context).color.primary,
                              ),
                              title: Text(
                                item,
                                style: AppTheme.text(context: context),
                              ),
                              contentPadding: EdgeInsets.zero,
                              horizontalTitleGap: 0,
                            ),
                          ),
                        ),
                      );
                    case EDynamicField.carousel:
                      return AppCarousel(
                        width: constraint.maxWidth,
                        height: 300,
                        data: List.from(
                          each.data.map(
                            (item) => CachedNetworkImage(imageUrl: item),
                          ),
                        ),
                      );
                    default:
                  }
                },
              ),
            ),
          ),
        );
      }),
    );
  }
}
