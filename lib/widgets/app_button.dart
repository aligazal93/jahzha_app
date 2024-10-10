import 'package:flutter/material.dart';
import 'package:jahzha_app/core/helpers/dimensions.dart';
import '../core/helpers/app_colors.dart';
import '../core/helpers/utils.dart';
import 'app_loading_indicator.dart';
import 'app_text.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.title,
    this.color = AppColors.primary,
    this.titleColor = AppColors.white,
    this.onTap,
    this.margin = EdgeInsets.zero,
    this.padding,
    this.height,
    this.titleFontSize = 16,
    this.isLoading = false,
    this.constrainedAxis = Axis.vertical,
    this.borderColor = Colors.transparent,
  });

  final String title;
  final Color color;
  final Color borderColor;
  final Color titleColor;
  final VoidCallback? onTap;
  final EdgeInsets margin;
  final EdgeInsets? padding;
  final double? height;
  final double titleFontSize;
  final bool isLoading;
  final Axis constrainedAxis;

  double get _radius => 12;

  factory AppButton.outline({
    required String title,
    Color borderColor = AppColors.primary,
    Color titleColor = AppColors.black,
    VoidCallback? onTap,
    bool isLoading = false,
    Axis constrainedAxis = Axis.vertical,
  }) {
    return _OutlineAppButton(
      title: title,
      onTap: onTap,
      color: borderColor,
      titleColor: titleColor,
      isLoading: isLoading,
      constrainedAxis: constrainedAxis,
    );
  }

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      constrainedAxis: constrainedAxis,
      child: Padding(
        padding: margin,
        child: isLoading ? AppLoadingIndicator() : InkWell(
          onTap: () {
            if (onTap != null) {
              onTap!();
              Utils.dismissKeyboard();
            }
          },
          radius: _radius,
          borderRadius: BorderRadius.circular(_radius),
          child: Container(
            height: height ?? 55.height,
            padding: padding ?? EdgeInsets.symmetric(horizontal: 48.width),
            alignment: Alignment.center,
            child: AppText(
              title: title,
              color: titleColor,
              fontSize: titleFontSize,
              fontWeight: FontWeight.w400,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: borderColor,
              ),
              borderRadius: BorderRadius.circular(_radius),
              color: onTap == null ? AppColors.lightGray : color,
            ),
          ),
        ),
      ),
    );
  }
}

class _OutlineAppButton extends AppButton {
  _OutlineAppButton({
    required super.title,
    super.onTap,
    super.color = AppColors.primary,
    super.titleColor = AppColors.black,
    required super.isLoading,
    super.constrainedAxis,
    super.borderColor = AppColors.white

  });

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      constrainedAxis: constrainedAxis,
      child: Padding(
        padding: margin,
        child: isLoading ? AppLoadingIndicator() : InkWell(
          onTap: () {
            if (onTap != null) {
              onTap!();
              Utils.dismissKeyboard();
            }
          },
          radius: _radius,
          borderRadius: BorderRadius.circular(_radius),
          child: Container(
            height: 48.height,
            alignment: Alignment.center,
            padding: padding ?? EdgeInsets.symmetric(horizontal: 48.width),
            child: AppText(
              title: title,
              color: onTap == null ? AppColors.darkGray : titleColor,
              fontSize: titleFontSize,
              fontWeight: FontWeight.w600,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(_radius),
              color: AppColors.white,
              border: Border.all(
                color: onTap == null ? AppColors.darkGray : color,
                width: 1,
              )
            ),
          ),
        ),
      ),
    );
  }
}
