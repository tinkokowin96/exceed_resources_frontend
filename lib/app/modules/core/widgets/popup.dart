import 'package:exceed_resources_frontend/app/modules/core/theme/sizebox.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/button/button.dart';
import 'package:flutter/material.dart';

class AppPopup extends StatefulWidget {
  final String confirmText;
  final Function()? confirmPressed;
  final bool cancel;
  final Widget child;

  const AppPopup({
    Key? key,
    required this.child,
    this.confirmText = 'Confirm',
    this.cancel = false,
    this.confirmPressed,
  }) : super(key: key);

  @override
  State<AppPopup> createState() => _AppPopupState();
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
        (value) => confirm && widget.confirmPressed != null ? widget.confirmPressed!() : null,
      );

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
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
            child: SizedBox(
              width: 400,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  widget.child,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppButton(onPressed: () => exit(), text: widget.confirmText),
                      widget.cancel
                          ? AppButton(onPressed: () => exit(confirm: false), text: 'Cancel')
                          : AppSizeBox.zero,
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
}
