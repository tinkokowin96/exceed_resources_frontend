import 'dart:async';

import 'package:exceed_resources_frontend/app/modules/core/extensions/int_extension.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:flutter/material.dart';

class AppTimer extends StatefulWidget {
  final DateTime until;
  final Function() onCompleted;
  final TextStyle? style;
  const AppTimer({
    Key? key,
    required this.until,
    required this.onCompleted,
    this.style,
  }) : super(key: key);

  @override
  State<AppTimer> createState() => _AppTimerState();
}

class _AppTimerState extends State<AppTimer> {
  late int _remaining = widget.until.difference(DateTime.now()).inSeconds;
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
    return Text(_remaining.countTime(), style: widget.style ?? AppTheme.text(context: context));
  }
}
