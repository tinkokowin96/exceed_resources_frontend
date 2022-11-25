import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ReportSize extends StatefulWidget {
  final Function(Size size) onChange;
  final Widget child;
  final bool report;
  const ReportSize({
    super.key,
    required this.onChange,
    required this.child,
    this.report = true,
  });

  @override
  State<ReportSize> createState() => _ReportSizeState();
}

class _ReportSizeState extends State<ReportSize> {
  final _key = GlobalKey();

  void executeAfterBuild(_) {
    final context = _key.currentContext;
    if (context == null) return;
    widget.onChange(context.size!);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.report) SchedulerBinding.instance.addPostFrameCallback(executeAfterBuild);
    return SizedBox(
      key: _key,
      child: widget.child,
    );
  }
}
