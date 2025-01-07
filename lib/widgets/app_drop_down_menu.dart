import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jahzha_app/core/helpers/dimensions.dart';

import '../../../../../../core/helpers/app_colors.dart';
import '../core/helpers/utils.dart';
import 'app_sheet.dart';
import 'app_text.dart';
import 'app_text_field.dart';
import 'empty_view.dart';

class AppDropDownMenu<T> extends StatefulWidget {
  const AppDropDownMenu({
    Key? key,
    this.hint,
    required this.onChange,
    required this.items,
    this.value,
    this.modeling = false,
    this.multiSelect = false,
    this.enableAllOption = false,
    this.enableSearch = false,
    this.fillColor = AppColors.white,
    this.borderColor = AppColors.darkGrayBlue,
    this.label,
    this.leading,
    this.validator,
  }) : super(key: key);

  final String? hint;
  final dynamic value;
  final Function(dynamic v) onChange;
  final List<T> items;
  final bool modeling;
  final Color fillColor;
  final Color borderColor;
  final bool multiSelect;
  final bool enableAllOption;
  final bool enableSearch;
  final String? label;
  final Widget? leading;
  final String? Function(dynamic)? validator;

  @override
  State<AppDropDownMenu> createState() => _AppDropDownMenuState<T>();
}

class _AppDropDownMenuState<T> extends State<AppDropDownMenu> {
  final controller = TextEditingController();
  dynamic value;

  @override
  void initState() {
    value = widget.value;
    controller.text = convertValueToText() ?? '';
    super.initState();
  }

  String? convertValueToText() {
    if (value == null) {
      return null;
    }
    // if (value == 'all') {
    //   return (Utils.isAR ? 'الكل' : 'All');
    // }
    if (!widget.multiSelect) {
      if (widget.modeling) {
        return value?.name;
      } else {
        return value.toString();
      }
    }
    // if (value.isEmpty) {
    //   return (Utils.isAR ? 'الكل' : 'All');
    // }
    if (widget.modeling) {
      return (value as List).map((e) => e?.name).join(', ');
    } else {
      return (value as List).map((e) => e.toString()).join(', ');
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: controller,
      label: widget.label,
      hint: widget.hint,
      validator: widget.validator,
      // suffixIcon: widget.leading,
      fillColor: widget.fillColor,
      borderColor: widget.borderColor,
      suffixIcon: Icon(
        Icons.keyboard_arrow_down_rounded,
        size: 28.height,
        color:
            widget.items.isEmpty ? AppColors.lightGray : AppColors.secondary,
      ),
      onTap: _Sheet<T>(
        label: widget.label,
        value: value,
        multiSelect: widget.multiSelect,
        enableAllOption: widget.enableAllOption,
        enableSearch: widget.enableSearch,
        onChange: (v) {
          value = v;
          setState(() {});
          widget.onChange(widget.multiSelect
              ? (value as List).map((e) => e as T).toList()
              : value);
          controller.text = convertValueToText() ?? '';
        },
        items: widget.items,
        modeling: widget.modeling,
      ).show,
    );
  }
}

class _Sheet<T> extends StatefulWidget {
  const _Sheet({
    Key? key,
    required this.label,
    required this.multiSelect,
    required this.enableAllOption,
    required this.enableSearch,
    required this.value,
    required this.onChange,
    required this.items,
    required this.modeling,
  }) : super(key: key);

  final String? label;
  final bool multiSelect;
  final bool enableAllOption;
  final bool enableSearch;
  final dynamic value;
  final Function(dynamic v) onChange;
  final List items;
  final bool modeling;

  Future<void> show() async {
    return AppSheet.show(
      title: label,
      child: this,
    );
  }

  @override
  State<_Sheet> createState() => _SheetState<T>();
}

class _SheetState<T> extends State<_Sheet> {
  dynamic value;
  final searchTXController = TextEditingController();
  List<dynamic>? searchedItems;

  @override
  void initState() {
    Future.delayed(
      Duration.zero,
      () {
        if (widget.multiSelect) {
          for (var i in widget.value ?? []) {
            select(i);
          }
        } else {
          select(widget.value);
        }
      },
    );
    super.initState();
  }

  void select(dynamic v) {
    if (v == null) {
      value = null;
    } else if (widget.multiSelect) {
      value ??= [];
      if ((value as List).contains(v)) {
        (value as List).remove(v);
      } else {
        (value as List).add(v);
      }
      if ((value as List).length == widget.items.length) {
        value ??= [];
      }
    } else {
      value = v;
    }
    setState(() {});
    widget.onChange(value);
    Utils.dismissKeyboard();
  }

  @override
  void dispose() {
    searchTXController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: context.height(2.5),
      ),
      child: Column(
        children: [
          if (widget.enableSearch)
            Padding(
              padding: EdgeInsets.only(top: 16.height),
              child: AppTextField(
                hint: 'search'.tr(),
                controller: searchTXController,
                suffixIcon: UnconstrainedBox(
                  child: Icon(FontAwesomeIcons.magnifyingGlass, size: 16),
                ),
                onChanged: (v) {
                  if (v.isEmpty) {
                    searchedItems = null;
                  } else {
                    searchedItems = widget.items.where((element) {
                      if (widget.modeling) {
                        return element.name.toLowerCase().contains(v.toLowerCase());
                      } else {
                        return element.toString().toLowerCase().contains(v.toLowerCase());
                      }
                    }).toList();
                  }
                  setState(() {});
                },
                trailing: Builder(builder: (context) {
                  if (searchedItems == null) {
                    return SizedBox();
                  }
                  return InkWell(
                    onTap: () {
                      searchTXController.clear();
                      searchedItems = null;
                      setState(() {});
                      Utils.dismissKeyboard();
                    },
                    child: Icon(
                      FontAwesomeIcons.xmark,
                      color: AppColors.secondary,
                      size: 16,
                    ),
                  );
                }),
              ),
            ),
          Expanded(
            child: Builder(
              builder: (context) {
                if (searchedItems?.isEmpty ?? false) {
                  return EmptyView(
                    title: 'no_result'.tr(),
                    height: 120.height,
                    fontSize: 12.font,
                  );
                }
                return ListView.builder(
                  padding: EdgeInsets.only(
                    top: 16.height,
                  ),
                  itemCount: searchedItems?.length ?? (widget.items.length + (widget.enableAllOption ? 1 : 0)),
                  itemBuilder: (context, index) {
                    index = index - (searchedItems == null && widget.enableAllOption ? 1 : 0);
                    if (searchedItems == null && widget.enableAllOption && index == -1) {
                      return _item(
                        isSelected: value == null || (widget.multiSelect && (value as List).isEmpty),
                        value: value,
                        isAllOption: true,
                        onTap: (_) {
                          select(null);
                          Navigator.pop(context);
                        },
                      );
                    }
                    final item = (searchedItems ?? widget.items)[index];
                    return _item(
                      value: item,
                      isSelected: widget.multiSelect ? (value as List?)?.contains(item) ?? false : value == item,
                      onTap: (_) {
                        select(item);
                        if (!widget.multiSelect) {
                          Navigator.pop(context);
                        }
                      },
                    );
                  },
                );
              }
            ),
          )
        ],
      ),
    );
  }

  Widget _item({
    required bool isSelected,
    required dynamic value,
    required void Function(dynamic v)? onTap,
    bool isAllOption = false,
  }) {
    return InkWell(
      onTap: () => onTap?.call(!isSelected),
      child: Container(
        margin: EdgeInsets.only(bottom: 6.height),
        child: Row(
          children: [
            Builder(
              builder: (context) {
                if (widget.multiSelect) {
                  return Checkbox(
                    value: isSelected,
                    activeColor: AppColors.primary,
                    onChanged: (v) => onTap?.call(v!),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  );
                }
                return Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Container(
                    width: 18,
                    height: 18,
                    margin: EdgeInsets.symmetric(
                      vertical: 16.height,
                      horizontal: 12.width,
                    ),
                    child: Container(
                      margin: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.white,
                      ),
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          isSelected ? AppColors.primary : Colors.transparent,
                      border: Border.all(
                        color: isSelected
                            ? AppColors.primary
                            : AppColors.darkGrayBlue,
                        width: 2,
                      ),
                    ),
                  ),
                );
              },
            ),
            AppText(
              title: isAllOption
                  ? (Utils.isAR ? 'الكل' : 'All')
                  : widget.modeling
                      ? value.name
                      : value.toString(),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary.withOpacity(0.4) : Colors.transparent,
          borderRadius: BorderRadius.circular(8.radius),
        ),
      ),
    );
  }
}

/*
class AppDropDownMenu extends StatefulWidget {
  const AppDropDownMenu({
    Key? key,
    this.hint,
    required this.onChange,
    required this.items,
    this.value,
    this.modeling = false,
    this.multiSelect = false,
    this.enableAllOption = false,
    this.fillColor = AppColors.white,
    this.borderColor = AppColors.primary50,
    this.label,
    this.leading,
    this.validator,
  }) : super(key: key);

  final String? hint;
  final dynamic value;
  final Function(dynamic v) onChange;
  final List items;
  final bool modeling;
  final Color fillColor;
  final Color borderColor;
  final bool multiSelect;
  final bool enableAllOption;
  final String? label;
  final Widget? leading;
  final String? Function(dynamic)? validator;

  @override
  State<AppDropDownMenu> createState() => _AppDropDownMenuState();
}

class _AppDropDownMenuState extends State<AppDropDownMenu> {
  dynamic value;
  List<dynamic> searchedItems = [];

  @override
  void initState() {
    value = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Padding(
            padding: EdgeInsets.only(bottom: 8.height),
            child: AppText(
              title: widget.label!,
              color: AppColors.neutral600,
              fontWeight: FontWeight.w500,
            ),
          ),
        DropdownButtonFormField(
          key: UniqueKey(),
          isDense: true,
          validator: widget.validator,
          decoration: InputDecoration(
            isCollapsed: true,
            isDense: true,
            fillColor: widget.fillColor,
            prefixIcon: widget.leading,
            filled: true,
            hintText: widget.hint,
            hintStyle: TextStyle(
              color: AppColors.neutral400,
              fontSize: 14.font,
              fontWeight: FontWeight.w300,
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 12.width,
              vertical: 12.height,
            ),
            border: _border(widget.borderColor),
            enabledBorder: _border(widget.borderColor),
            focusedBorder: _border(widget.borderColor),
            errorBorder: _border(AppColors.alertCritical),
            focusedErrorBorder: _border(widget.borderColor),
          ),
          isExpanded: true,
          hint: Builder(
            builder: (context) {
              String text = widget.hint ?? '';
              bool bold = false;
              if (value != null) {
                if (value.runtimeType.toString().contains('List') && value.isNotEmpty) {
                  text = value
                      .map((e) => widget.modeling ? e.name : e.toString())
                      .join(' / ');
                  bold = true;
                } else if (!widget.multiSelect) {
                  text = (widget.modeling ? value.name : value.toString());
                  bold = true;
                }
              }
              return AppText(
                title: text,
                color: bold ? AppColors.neutral800 : AppColors.neutral500,
                fontSize: 14.font,
                fontWeight: FontWeight.w300,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              );
            },
          ),
          value: null,
          style: TextStyle(
            fontSize: 14.font,
            color: AppColors.black,
            fontFamily: context.localizedFontFamily.id,
          ),
          padding: EdgeInsets.zero,
          iconSize: 30.height,
          iconEnabledColor: AppColors.neutral500,
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
          ),
          iconDisabledColor: AppColors.neutral200,
          items: [
            // DropdownMenuItem(
            //   enabled: false,
            //   child: Padding(
            //     padding: EdgeInsets.only(bottom: 10.height),
            //     child: AppTextField(
            //       hint: 'search'.tr(),
            //       onChanged: (v) {
            //         searchedItems.clear();
            //         if (v.trim().isNotEmpty) {
            //           searchedItems = widget.items.where((e) => (widget.modeling ? e.name : e).toString().contains(v)).toList();
            //         }
            //       },
            //     ),
            //   ),
            // ),
            if (widget.enableAllOption)
              _item(
                isSelected: value == null,
                value: 'all',
                isAllOption: true,
              ),
            ...(searchedItems.isNotEmpty ? searchedItems : widget.items).map((e) {
              bool isSelected = false;
              if (value != null) {
                if (value.runtimeType.toString().contains('List')) {
                  isSelected = value.contains(e);
                } else {
                  isSelected = value == e;
                }
              }
              return _item(
                isSelected: isSelected,
                value: e,
              );
            }),
          ],
          onChanged: (v) {
            if (v == 'all') {
              value = null;
            } else if (widget.multiSelect) {
              value ??= [];
              if ((value as List).contains(v)) {
                (value as List).remove(v);
              } else {
                (value as List).add(v);
              }
              if ((value as List).length == widget.items.length) {
                value = null;
              }
            } else {
              value = v;
            }
            setState(() {});
            widget.onChange(value);
            Utils.dismissKeyboard();
          },
          // elevation: 1,
          dropdownColor: AppColors.white,
        ),
      ],
    );
  }

  InputBorder _border(Color color, {double width = 1}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(_radius),
      borderSide: BorderSide(
        color: color,
        width: width,
      ),
    );
  }

  double get _radius => 12;

  DropdownMenuItem _item({
    required bool isSelected,
    required dynamic value,
    bool isAllOption = false,
  }) {
    return DropdownMenuItem(
      child: Container(
        margin: EdgeInsets.only(bottom: 6.height),
        child: Row(
          children: [
            Builder(builder: (context) {
              if (widget.multiSelect) {
                return Checkbox(
                  value: isSelected,
                  activeColor: AppColors.primary,
                  onChanged: (v) {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                );
              }
              return Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Container(
                  width: 18,
                  height: 18,
                  margin: EdgeInsets.symmetric(
                    vertical: 16.height,
                    horizontal: 12.width,
                  ),
                  child: Container(
                    margin: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.white,
                    ),
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected ? AppColors.primary : Colors.transparent,
                    border: Border.all(
                      color:
                          isSelected ? AppColors.primary : AppColors.neutral300,
                      width: 2,
                    ),
                  ),
                ),
              );
            }),
            Text(
              isAllOption
                  ? 'all'.tr()
                  : widget.modeling
                      ? value.name
                      : value.toString(),
              style: TextStyle(
                fontFamily: context.localizedFontFamily.id,
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary50 : Colors.transparent,
          borderRadius: BorderRadius.circular(8.radius),
        ),
      ),
      value: value,
    );
  }
}

 */
