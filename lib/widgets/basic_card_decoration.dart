import 'package:flutter/material.dart';
import 'package:jahzha_app/core/helpers/dimensions.dart';

import '../core/helpers/app_colors.dart';

class BasicCard extends Container {
  BasicCard({
    this.radius,
    this.height,
    this.width,
    this.enableShadow = false,
    this.onTap,
    super.child,
    super.padding,
    super.color,
  });

  final double? radius;
  final double? height;
  final double? width;
  final bool enableShadow;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        child: child,
        padding: padding ??
            EdgeInsets.symmetric(
              vertical: 16.height,
              horizontal: 16.width,
            ),
        decoration: BoxDecoration(
          color: color ?? AppColors.white,
          borderRadius: BorderRadius.circular(
            radius ?? 12.radius,
          ),
          boxShadow: [
            if (enableShadow) BoxShadow(
              color: AppColors.darkGrayBlue,
              blurRadius: 30,
              spreadRadius: -8,
              offset: Offset(0, -8),
            ),
          ],
        ),
      ),
    );
  }
}
