import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jahzha_app/core/helpers/dimensions.dart';
import 'package:jahzha_app/widgets/app_text.dart';

import '../core/helpers/app_colors.dart';
import '../core/helpers/utils.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    this.hint,
    this.validator,
    this.textInputAction = TextInputAction.next,
    this.inputType = TextInputType.text,
    this.onTap,
    this.label,
    this.maxLines = 1,
    this.borderColor = AppColors.darkGrayBlue,
    this.fillColor = Colors.transparent,
    this.onSaved,
    this.onChanged,
    this.controller,
    this.secure = false,
    this.vMargin = 8,
    this.hMargin = 0,
    this.enabled = true,
    this.focusNode,
    this.suffixIcon,
    this.maxLength,
    this.showRequiredSign = false,
    this.textAlign = TextAlign.start,
  });



  final String? hint;
  final bool showRequiredSign;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextInputAction textInputAction;
  final TextAlign textAlign;
  final TextInputType inputType;
  final VoidCallback? onTap;
  final String? label;
  final int maxLines;
  final Color borderColor;
  final int? maxLength;
  final Color fillColor;
  final FocusNode? focusNode;
  final Widget? suffixIcon;
  final bool secure;
  final bool enabled;
  final void Function(String?)? onSaved;
  final TextEditingController? controller;
  final double vMargin;
  final double hMargin;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool? _showPassword;

  @override
  void initState() {
    _showPassword = widget.secure;
    super.initState();
  }

  @override
  void dispose() {
    widget.focusNode?.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: widget.vMargin,
        horizontal: widget.hMargin,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.label != null)
            Padding(
              padding: EdgeInsets.only(
                bottom: widget.showRequiredSign ? 0 : 8.height,
                right: 8,
                left: 8,
              ),
              child: Row(
                children: [
                  Flexible(
                    child: AppText(
                      fontSize: 14,
                      padding: widget.showRequiredSign ? EdgeInsets.only(
                        bottom: 8.height,
                      ) : EdgeInsets.zero,
                      title: widget.label!,
                      color: AppColors.secondary.theme,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  if (widget.showRequiredSign)
                    AppText(
                      fontSize: 20,
                      title: ' *',
                      color: AppColors.red,
                      fontWeight: FontWeight.w500,
                    ),
                ],
              ),
            ),
          InkWell(
            radius: _radius,
            onTap: widget.onTap != null ? () {
              Utils.dismissKeyboard();
              widget.onTap!();
            } : null,
            borderRadius: BorderRadius.circular(_radius),
            child: AbsorbPointer(
              absorbing: widget.onTap != null,
              child: TextFormField(
                focusNode: widget.focusNode,
                controller: widget.controller,
                cursorColor: AppColors.secondary,
                enabled: widget.enabled,
                validator: widget.validator,
                textAlign: widget.textAlign,
                onChanged: widget.onChanged,
                maxLength: widget.maxLength,
                textInputAction: TextInputAction.done,
                keyboardType: widget.inputType,
                maxLines: widget.maxLines,
                onSaved: widget.onSaved,
                obscureText: _showPassword!,
                decoration: InputDecoration(
                  hintText: widget.hint ?? '',
                  fillColor: widget.fillColor,
                  filled: true,
                  hintStyle: TextStyle(
                    color: AppColors.secondary.theme,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  suffixIcon: widget.suffixIcon != null ? widget.suffixIcon : widget.secure ? IconButton(
                    padding: const EdgeInsets.all(0),
                    icon: Icon(
                      _showPassword! ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye,
                      color: AppColors.primary.theme,
                      size: 18,
                    ),
                    onPressed: ()=> setState(()=> _showPassword = !_showPassword!),
                  ) : null,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.width, vertical: 19.height),
                  border: _border(widget.borderColor),
                  enabledBorder: _border(widget.borderColor),
                  focusedBorder: _border(AppColors.primary, width: 1),
                  errorBorder: _border(AppColors.red),
                  focusedErrorBorder: _border(AppColors.secondary.theme, width: 1),
                ),
                style: TextStyle(
                  color: AppColors.secondary.theme
                ),
              ),
            ),
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

  double get _radius => widget.maxLines > 1 ? 22 : 14;
}