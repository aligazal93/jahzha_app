import 'package:flutter/material.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/core/helpers/dimensions.dart';
import '../core/helpers/utils.dart';
import 'app_text.dart';

class AppDropDownMenu extends StatefulWidget {
  const AppDropDownMenu({
    Key? key,
    required this.hint,
    required this.onChange,
    required this.items,
    this.value,
    this.modeling = false,
    this.fillColor,
    this.label,
    this.validator,
  }) : super(key: key);

  final String hint;
  final dynamic value;
  final Function(dynamic) onChange;
  final List items;
  final bool modeling;
  final Color? fillColor;
  final String? label;
  final String? Function(dynamic)? validator;

  @override
  State<AppDropDownMenu> createState() => _AppDropDownMenuState();
}

class _AppDropDownMenuState extends State<AppDropDownMenu> {
  dynamic value;

  @override
  void initState() {
    value = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.label != null)
            Padding(
              padding: EdgeInsets.only(bottom: 8.height),
              child: AppText(
                title: widget.label!,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          DropdownButtonFormField(
            isExpanded: true,
            padding: EdgeInsets.zero,
            isDense: true,
            validator: widget.validator,
            decoration: InputDecoration(
              fillColor: widget.fillColor ?? AppColors.white.theme,
              filled: true,
              hintText: widget.hint,
              hintStyle: TextStyle(
                color: AppColors.darkGray.theme,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 12.width, vertical: 8.height),
              border: _border(AppColors.darkGray.theme),
              enabledBorder: _border(AppColors.darkGray.theme),
              focusedBorder: _border(AppColors.darkGray.theme),
              errorBorder: _border(AppColors.red),
              focusedErrorBorder: _border(AppColors.darkGray.theme),
            ),
            hint: Text(
              widget.hint,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.secondary.theme,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
            value: value,
            iconSize: 22,
            iconEnabledColor: AppColors.secondary.theme,
            icon: Icon(Icons.keyboard_arrow_down_rounded),
            iconDisabledColor: AppColors.tGray.theme,
            items: widget.items.map((e) => DropdownMenuItem(
              child: Text(widget.modeling ? e.name : e.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.secondary.theme,fontSize: 14),
              ),
              value: e,
            )).toList(),
            onChanged: (value) {
              this.value = value;
              setState(() {});
              widget.onChange(value);
              Utils.dismissKeyboard();
            },
          ),
        ],
      ),
    );
  }

  InputBorder _border(Color color, {double width = 0.5}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(_radius),
      borderSide: BorderSide(
        color: color,
        width: width,
      ),
    );
  }

  double get _radius => 12;

}