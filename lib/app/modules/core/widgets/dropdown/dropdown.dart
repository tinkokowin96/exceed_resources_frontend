import 'dart:async';
import 'package:exceed_resources_frontend/app/modules/core/models/action_text_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/models/option_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/miscs.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/button/text_button.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/checkbox.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/column.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/container.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AppDropdown extends StatefulWidget {
  final List<MOption> items;
  final Function({MOption? value, bool? checked}) onChanged;
  final bool isMulti;
  final bool searchable;
  final bool noPadding;
  final bool loading;
  final EText textSize;
  final InputDecoration? decoration;
  final bool? attach;
  final TextEditingController? dropdownController;
  final String? hint;
  final MOption? defaultOption;
  final Widget? customSelector;
  final Function(String value)? onSearched;
  final List<MOption>? initialItems;
  final List<String>? selected;
  final MActionText? addNew;
  final Function(String? value)? validator;
  final String? title;
  const AppDropdown({
    Key? key,
    required this.items,
    required this.onChanged,
    this.loading = false,
    this.searchable = false,
    this.noPadding = false,
    this.isMulti = false,
    this.textSize = EText.h3,
    this.decoration,
    this.dropdownController,
    this.attach,
    this.hint,
    this.defaultOption,
    this.customSelector,
    this.onSearched,
    this.selected,
    this.initialItems,
    this.validator,
    this.addNew,
    this.title,
  }) : super(key: key);

  @override
  State<AppDropdown> createState() => _AppDropdownState();
}

class _AppDropdownState extends State<AppDropdown> {
  final _layerLink = LayerLink();
  late final FocusNode _focusNode;
  late final OverlayState? _overlay;
  late final OverlayEntry? _entry;
  late final List<String> _selected = widget.selected ?? [];
  late MOption _selectedOption = widget.defaultOption ?? widget.items[0];
  String searchedText = '';
  bool _showDropdown = false;
  Timer? _timer;

  void debounceSearch(String search) {
    searchedText = search;
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(
      const Duration(milliseconds: 400),
      (() => widget.onSearched != null ? widget.onSearched!(search) : () => null),
    );
  }

  void selectDropdownHandler({required MOption value, bool? checked}) {
    setState(() {
      if (checked == null) {
        if (widget.dropdownController != null) {
          widget.dropdownController!.text = value.text;
        }
        _selectedOption = value;
        _focusNode.unfocus();
        showDropdown(false);
      } else {
        if (checked) {
          final isAlreadySelected = _selected.contains(value.text);
          if (!isAlreadySelected) {
            _selected.add(value.text);
          }
        } else {
          _selected.removeWhere((item) => item == value.text);
        }

        if (widget.dropdownController != null) {
          widget.dropdownController!.text = '';
          for (final item in _selected) {
            if (widget.dropdownController!.text.isEmpty) {
              widget.dropdownController!.text += item;
            } else {
              widget.dropdownController!.text += ', $item';
            }
          }
        }
        _entry!.markNeedsBuild();
      }
      widget.onChanged(value: value, checked: checked);
    });
  }

  void executeAfterBuild(bool build) {
    if (build) {
      _entry!.markNeedsBuild();
    } else {
      final renderBox = context.findRenderObject() as RenderBox;
      final position = renderBox.localToGlobal(Offset.zero);
      final screenHeight = MediaQuery.of(context).size.height;
      const dropdownPadding =
          2 * AppSize.sm + 2 * AppSize.md; //dropdown option padding + add some space for longer text
      final dropdownWidth = renderBox.size.width + dropdownPadding;
      final rightPosition = position.dx + renderBox.size.width;
      final overScreen = rightPosition - rightPosition + dropdownPadding;

      _overlay = Overlay.of(context)!;
      _entry = OverlayEntry(
        builder: (context) => Positioned(
          width: dropdownWidth,
          child: CompositedTransformFollower(
            link: _layerLink,
            showWhenUnlinked: false,
            offset: Offset(
              overScreen > 0 ? -overScreen : 0,
              position.dy / screenHeight < 0.7 ? renderBox.size.height + AppSize.sm : -(AppSize.dH + AppSize.md),
            ),
            child: DopdownItems(
              items: !widget.loading && widget.initialItems != null && searchedText.isEmpty
                  ? widget.initialItems!
                  : widget.items,
              selectedOption: _selectedOption,
              loading: widget.loading,
              noPadding: widget.noPadding,
              focus: _focusNode,
              addNew: widget.addNew,
              textSize: widget.textSize,
              selectDropdownHandler: selectDropdownHandler,
              isMulti: widget.isMulti,
              selected: _selected,
            ),
          ),
        ),
      );
    }

    if (widget.attach != null && widget.attach != _showDropdown) {
      showDropdown(widget.attach!);
    }
  }

  void showDropdown(bool show) {
    _showDropdown = show;
    if (show) {
      _overlay!.insert(_entry!);
      // setState(() {
      //   _selectedOption = null;
      // });
    } else {
      if (widget.searchable && widget.dropdownController != null) {
        widget.dropdownController!.text = '';
      }
      _entry!.remove();
      // if (_selectedOption == null) {
      widget.onChanged();
      // }
    }
  }

  @override
  void initState() {
    _focusNode = FocusNode();
    if (widget.defaultOption != null && widget.dropdownController != null) {
      widget.dropdownController!.text = widget.defaultOption!.text;
    } else if (widget.dropdownController != null) {
      widget.dropdownController!.text = widget.items.first.text;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) => executeAfterBuild(false));
    super.initState();
  }

  @override
  void didUpdateWidget(AppDropdown oldWidget) {
    WidgetsBinding.instance.addPostFrameCallback((_) => executeAfterBuild(true));
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    if (_overlay != null) {
      //   _overlay!.dispose(); NOTE: this triggering error may be bug in flutter
    }
    if (_entry != null) {
      _entry!.dispose();
    }
    if (_timer != null) {
      _timer!.cancel();
    }
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: widget.customSelector == null
          ? Focus(
              onFocusChange: (hasFocus) => showDropdown(hasFocus),
              child: TextFormField(
                controller: widget.dropdownController,
                focusNode: _focusNode,
                readOnly: !widget.searchable,
                style: AppTheme.text(context: context),
                textAlignVertical: TextAlignVertical.center,
                onChanged: (value) => {debounceSearch(value)},
                validator: (String? value) => widget.validator != null ? widget.validator!(value) : null,
                decoration: widget.decoration ?? AppThemeMiscs.inputStyle(context: context, hintText: widget.hint),
              ),
            )
          : GestureDetector(
              onTap: () => widget.attach != null ? null : showDropdown(!_showDropdown),
              child: widget.customSelector,
            ),
    );
  }
}

class DopdownItems extends StatelessWidget {
  final bool loading;
  final List<MOption> items;
  final MOption selectedOption;
  final FocusNode focus;
  final Function({required MOption value, bool? checked}) selectDropdownHandler;
  final bool noPadding;
  final bool isMulti;
  final EText textSize;
  final List<String> selected;
  final MActionText? addNew;

  const DopdownItems({
    Key? key,
    required this.loading,
    required this.items,
    required this.selectedOption,
    required this.selectDropdownHandler,
    required this.focus,
    required this.noPadding,
    required this.isMulti,
    required this.selected,
    required this.textSize,
    this.addNew,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [AppThemeMiscs.shadow1],
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppSize.sm),
          child: SingleChildScrollView(
            child: Column(
              children: [
                if (loading) ...[
                  SizedBox(
                    height: AppSize.dH,
                    child: Center(
                      child: Lottie.asset(
                        'assets/animation/search_loading.json',
                        width: AppSize.dL,
                      ),
                    ),
                  ),
                ] else ...[
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: AppSize.dH),
                    child: SingleChildScrollView(
                      child: AppColumn(
                        spacing: AppSize.sm,
                        children: List.from(
                          items.map(
                            (each) => !isMulti
                                ? Padding(
                                    padding: const EdgeInsets.only(bottom: AppSize.sm),
                                    child: InkWell(
                                      onTap: () => selectDropdownHandler(
                                        value: each,
                                      ),
                                      child: AppContainer(
                                        borderRadius: 0,
                                        customBorder: each.value == selectedOption.value
                                            ? Border.all(color: AppTheme.of(context).color.secondary.withOpacity(0.3))
                                            : null,
                                        background: each.value == selectedOption.value
                                            ? AppTheme.of(context).color.secondary.withOpacity(0.1)
                                            : Colors.transparent,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Align(
                                                alignment:
                                                    each.category != null ? Alignment.centerLeft : Alignment.center,
                                                child: Text(
                                                  each.text,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: AppTheme.text(context: context, size: textSize),
                                                ),
                                              ),
                                            ),
                                            if (each.category != null)
                                              ColoredBox(
                                                color: AppTheme.of(context).color.primary.withOpacity(0.2),
                                                child: Text(
                                                  each.category!,
                                                  style: AppTheme.text(
                                                      size: textSize, context: context, type: ETextType.primary),
                                                ),
                                              )
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          each.text,
                                          overflow: TextOverflow.ellipsis,
                                          style: AppTheme.text(context: context, size: textSize),
                                        ),
                                      ),
                                      AppCheckbox(
                                        selected: selected.contains(each.text),
                                        onChanged: (value) => selectDropdownHandler(
                                          value: each,
                                          checked: value,
                                        ),
                                      ),
                                    ],
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
                if (addNew != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: AppSize.sm),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppTextButton(
                          text: addNew!.text,
                          onPressed: () {
                            focus.unfocus();
                            addNew!.action();
                          },
                        )
                      ],
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
