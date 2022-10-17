import 'package:flutter/material.dart';

class AppAnimatedPress extends StatefulWidget {
  final Widget child;
  final Function() onPressed;
  const AppAnimatedPress({
    Key? key,
    required this.child,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<AppAnimatedPress> createState() => _AppAnimatedPressState();
}

class _AppAnimatedPressState extends State<AppAnimatedPress> with TickerProviderStateMixin {
  late final AnimationController _controller;
  double _scale = 1.0;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );

    _scaleAnimation = Tween(begin: 1.0, end: 0.9).animate(_controller);

    _scaleAnimation.addListener(() {
      setState(() {
        _scale = _scaleAnimation.value;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (td) {
        _controller.forward();
      },
      onTapUp: (tu) {
        _controller.reverse().then((value) => widget.onPressed());
      },
      child: Transform.scale(scale: _scale, child: widget.child),
    );
  }
}
