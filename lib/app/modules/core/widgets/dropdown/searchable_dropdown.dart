import 'dart:async';
import 'package:exceed_resources_frontend/app/modules/core/models/action_text_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/models/option_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/dropdown/dropdown.dart';
import 'package:flutter/material.dart';

class AppSearchableDropdown extends StatefulWidget {
  final Function({MOption? value, bool? checked}) onChanged;
  final String hint;
  final EAsyncDropdown type;
  final TextEditingController dropdownController;
  final bool isMulti;
  final MActionText? addNew;
  final String? title;
  final List<MOption>? initialItems;
  final Function(String? value)? validator;

  const AppSearchableDropdown({
    Key? key,
    required this.onChanged,
    required this.hint,
    required this.type,
    required this.dropdownController,
    this.isMulti = false,
    this.addNew,
    this.title,
    this.initialItems,
    this.validator,
  }) : super(key: key);

  @override
  State<AppSearchableDropdown> createState() => _AppSearchableDropdownState();
}

class _AppSearchableDropdownState extends State<AppSearchableDropdown> {
  bool _isLoading = false;
  Timer? _timer;
  List<MOption> _items = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer!.cancel();
    }
    super.dispose();
  }

  void updateItems(
    String search,
    EAsyncDropdown type,
  ) {
    setState(() {
      _isLoading = true;
      _items = [];
    });
    _timer = Timer(
      const Duration(milliseconds: 500),
      () {
        setState(
          () {
            _isLoading = false;
            _items = const [
              MOption(text: 'one', value: '1'),
              MOption(text: 'two', value: '2'),
              MOption(text: 'three', value: '3'),
            ];
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppDropdown(
      title: widget.title,
      hint: widget.hint,
      loading: _isLoading,
      initialItems: widget.initialItems,
      dropdownController: widget.dropdownController,
      onSearched: (String search) => updateItems(
        search,
        widget.type,
      ),
      addNew: widget.addNew,
      items: _items,
      isMulti: widget.isMulti,
      searchable: true,
      onChanged: ({value, checked}) => widget.onChanged(value: value, checked: checked),
      validator: (String? value) => widget.validator != null ? widget.validator!(value) : null,
    );
  }
}
