import 'package:exceed_resources_frontend/app/modules/core/controllers/app_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/miscs.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/sizebox.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/helper.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/button/button.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/container.dart';
import 'package:flutter/material.dart';

class AppPopup extends StatefulWidget {
  final String confirmText;
  final AppController controller;
  final bool cancel;
  final Widget child;

  const AppPopup({
    Key? key,
    required this.child,
    required this.controller,
    this.confirmText = 'Confirm',
    this.cancel = false,
  }) : super(key: key);

  @override
  State<AppPopup> createState() => _AppPopupState();

  factory AppPopup.info({
    required String info,
    required String title,
    required AppController controller,
    required BuildContext context,
  }) =>
      AppPopup(
        controller: controller,
        cancel: true,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: AppTheme.text(
                context: context,
                weight: FontWeight.w500,
                size: EText.h2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: AppSize.sm),
              child: Text(
                info,
                textAlign: TextAlign.center,
                style: AppTheme.text(context: context),
              ),
            ),
          ],
        ),
      );
}

class _AppPopupState extends State<AppPopup> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late final Animation _transfromAnimation1 = Tween(begin: -700.0, end: 20.0).animate(
    CurvedAnimation(
      parent: _controller,
      curve: const Interval(0, 0.6, curve: Curves.easeIn),
    ),
  );
  late final Animation _transfromAnimation2 = Tween(begin: 20.0, end: -20.0).animate(
    CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.6, 0.8, curve: Curves.easeOut),
    ),
  );
  late final Animation _transfromAnimation3 = Tween(begin: -20.0, end: 0.0).animate(
    CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.8, 1, curve: Curves.easeIn),
    ),
  );

  void exit({bool confirm = true}) => _controller.reverse().then(
        (_) => confirm ? widget.controller.confirmPopup() : widget.controller.cancelPopup(),
      );

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext content, _) {
          return Transform.translate(
            offset: Offset(
              0,
              _controller.value >= 0 && _controller.value <= 0.5
                  ? _transfromAnimation1.value
                  : _controller.value > 0.5 && _controller.value <= 0.7
                      ? _transfromAnimation2.value
                      : _transfromAnimation3.value,
            ),
            child: Center(
              child: AppContainer(
                background: AppTheme.of(context).color.secondaryContainer,
                padding: AppSize.md,
                width: App.width(context) * 0.9,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    widget.child,
                    Padding(
                      padding: const EdgeInsets.only(top: AppSize.md),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppButton(onPressed: () => exit(), text: widget.confirmText),
                          AppSizeBox.md,
                          widget.cancel
                              ? AppButton(onPressed: () => exit(confirm: false), text: 'Cancel')
                              : AppSizeBox.zero,
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
}
