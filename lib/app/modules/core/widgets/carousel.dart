import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/sizebox.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/config.dart';
import 'package:flutter/material.dart';

class AppCarousel extends StatefulWidget {
  final List<Widget> data;
  final double width;
  final double? height;

  const AppCarousel({
    Key? key,
    required this.data,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  State<AppCarousel> createState() => _AppCarouselState();
}

class _AppCarouselState extends State<AppCarousel> {
  late PageController _pageController;
  late int _currentPage;

  @override
  void initState() {
    _currentPage = widget.data.length > 1 ? 1 : 0;
    _pageController = PageController(
      viewportFraction: 1,
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
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Column(
        children: [
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraint) {
                return SizedBox(
                  width: constraint.maxWidth,
                  height: constraint.maxHeight,
                  child: PageView.builder(
                    itemCount: widget.data.length,
                    pageSnapping: true,
                    controller: _pageController,
                    scrollBehavior: AppScrollBehaviour(),
                    onPageChanged: (page) {
                      setState(() => _currentPage = page);
                    },
                    itemBuilder: (context, page) {
                      return widget.data[page];
                    },
                  ),
                );
              },
            ),
          ),
          AppSizeBox.sm,
          ActiveIndicator(numPage: widget.data.length, activePage: _currentPage)
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
            width: AppSize.aiiw,
            height: AppSize.aiiw,
            child: Stack(
              alignment: Alignment.center,
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppTheme.of(context).color.antiFlashWhite,
                    borderRadius: BorderRadius.circular(AppSize.aiiw / 2),
                  ),
                  child: const SizedBox(
                    width: AppSize.aiiw,
                    height: AppSize.aiiw,
                  ),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: index == activePage ? AppTheme.of(context).color.secondary : Colors.white,
                    borderRadius: BorderRadius.circular(AppSize.aiii / 2),
                  ),
                  child: const SizedBox(
                    width: AppSize.aiii,
                    height: AppSize.aiii,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
