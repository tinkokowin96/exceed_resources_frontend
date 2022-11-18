import 'package:exceed_resources_frontend/app/modules/core/models/dynamic_field_model.dart';
import 'package:flutter/material.dart';

class DynamicList extends StatefulWidget {
  const DynamicList({Key? key}) : super(key: key);

  @override
  State<DynamicList> createState() => _DynamicListState();
}

class _DynamicListState extends State<DynamicList> {
  final Map<int, MDynamicField> _fields = {};
  final Map<int, List<TextEditingController>> _controllers = {};

  void removeFieldHandler(int index) {
    setState(() => _fields.removeWhere((key, value) => key == index));
    _controllers.entries.where((each) => each.key == index).forEach((e) {
      for (final controller in e.value) {
        controller.dispose();
      }
    });
    _controllers.removeWhere((key, value) => key == index);
  }

  int addIndex() => _fields.isEmpty ? 1 : _fields.keys.last + 1;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
