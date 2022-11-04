import 'dart:async';

import 'package:exceed_resources_frontend/app/modules/core/utils/helper.dart';
import 'package:flutter/material.dart';

class AppTimer extends StatefulWidget {
  final DateTime until;
  final Function() onCompleted;
  final TextStyle style;
  const AppTimer({
    Key? key,
    required this.until,
    required this.onCompleted,
    required this.style,
  }) : super(key: key);

  @override
  State<AppTimer> createState() => _AppTimerState();
}

class _AppTimerState extends State<AppTimer> {
  late int _remaining = DateTime.now().difference(widget.until).inSeconds;
  late final Timer _timer;

  @override
  void initState() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _remaining -= 1;
      if (_remaining > 0) {
        setState(() {});
      } else {
        _timer.cancel();
        widget.onCompleted();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text(formatTime(_remaining), style: widget.style);
  }
}
