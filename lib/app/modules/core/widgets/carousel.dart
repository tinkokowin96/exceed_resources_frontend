import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/sizebox.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/config.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/helper.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/circle.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/report_size.dart';
import 'package:flutter/material.dart';

class AppCarousel extends StatefulWidget {
  final List<Widget> data;
  final int startPage;
  final double fraction;
  final bool showIndicator;
  final bool sameHeight;
  final double? width;
  final double? height;
  final Function(int index)? onChange;

  const AppCarousel({
    Key? key,
    required this.data,
    this.fraction = 1.0,
    this.showIndicator = true,
    this.startPage = 0,
    this.sameHeight = true,
    this.width,
    this.height,
    this.onChange,
  }) : super(key: key);

  @override
  State<AppCarousel> createState() => _AppCarouselState();
}

class _AppCarouselState extends State<AppCarousel> {
  late int _currentPage = widget.startPage;
  late PageController _pageController;
  late double _height = widget.height ?? 0;

  @override
  void initState() {
    _pageController = PageController(
      viewportFraction: widget.fraction,
      initialPage: _currentPage,
    );
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(AppCarousel oldWidget) {
    if (oldWidget.startPage != widget.startPage) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => _pageController.jumpToPage(widget.startPage),
      );
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? App.width(context),
      height: _height,
      child: Column(
        children: [
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraint) {
                return PageView.builder(
                  itemCount: widget.data.length,
                  pageSnapping: true,
                  controller: _pageController,
                  scrollBehavior: AppScrollBehaviour(),
                  onPageChanged: (page) {
                    setState(() => _currentPage = page);
                    if (widget.onChange != null) widget.onChange!(page);
                  },
                  itemBuilder: (context, page) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: widget.fraction < 1 ? AppSize.sm : 0),
                      child: Opacity(
                        opacity: page != _currentPage && widget.fraction < 1 ? 0.5 : 1,
                        child: OverflowBox(
                          minHeight: 0,
                          maxHeight: double.infinity,
                          child: ReportSize(
                            onChange: (size) {
                              if (_height != size.height + AppSize.md) {
                                setState(() {
                                  _height = size.height + AppSize.md;
                                });
                              }
                            },
                            report: widget.sameHeight ? _height == 0 : true,
                            child: widget.data[page],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          AppSizeBox.sm,
          if (widget.showIndicator)
            ActiveIndicator(
              numPage: widget.data.length,
              activePage: _currentPage,
            )
        ],
      ),
    );
  }
}

class ActiveIndicator extends StatelessWidget {
  final int numPage;
  final int activePage;
  const ActiveIndicator({
    Key? key,
    required this.numPage,
    required this.activePage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        numPage,
        (index) => Padding(
          padding: EdgeInsets.only(right: index + 1 == numPage ? 0 : AppSize.xs),
          child: SizedBox(
            width: AppSize.aiw,
            height: AppSize.aiw,
            child: Stack(
              alignment: Alignment.center,
              children: [
                AppCircle.container(
                  width: AppSize.aiw,
                  color: AppTheme.of(context).color.idle.withOpacity(0.1),
                ),
                AppCircle.container(
                  width: AppSize.aii,
                  color: index == activePage ? AppTheme.of(context).color.secondary : Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
