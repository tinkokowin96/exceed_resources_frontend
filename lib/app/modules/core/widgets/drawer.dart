import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/miscs.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/helper.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  final Widget child;
  final Function() exit;
  final bool exitDrawerRequest;

  const AppDrawer({
    Key? key,
    required this.child,
    required this.exit,
    this.exitDrawerRequest = false,
  }) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late final Animation _transfromAnimation = Tween(begin: 700.0, end: 0.0).animate(
    CurvedAnimation(
      parent: _controller,
      curve: const Interval(0, 0.6, curve: Curves.easeIn),
    ),
  );

  void exit() => _controller.reverse().then((value) => widget.exit());

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void didUpdateWidget(AppDrawer oldWidget) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        if (widget.exitDrawerRequest) {
          exit();
        }
      },
    );
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext content, _) {
          return Dismissible(
            key: const Key('drawer'),
            direction: DismissDirection.down,
            onUpdate: (details) => setState(() {}),
            onDismissed: (_) => widget.exit(),
            child: Transform.translate(
              offset: Offset(0, _transfromAnimation.value),
              child: Center(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppTheme.of(context).color.container,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(AppSize.sm),
                      topRight: Radius.circular(AppSize.sm),
                    ),
                    boxShadow: [AppThemeMiscs.shadow2],
                  ),
                  child: SizedBox(
                    width: App.width(context),
                    height: App.height(context) * 0.75,
                    child: Padding(
                      padding: const EdgeInsets.all(AppSize.md),
                      child: widget.child,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      );
}
