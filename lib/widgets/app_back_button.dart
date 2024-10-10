import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jahzha_app/core/helpers/dimensions.dart';
import 'package:jahzha_app/core/route_utils/route_utils.dart';
import '../core/helpers/app_colors.dart';
import '../core/helpers/utils.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({
    super.key,
    this.color,
    this.onTap,
    this.padding = EdgeInsets.zero,
  });

  final Color? color;
  final EdgeInsets padding;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Utils.isAR ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: padding,
        child: RotatedBox(
          quarterTurns: Utils.isAR ? 0 : 2,
          child: InkWell(
            onTap: onTap ?? () => RouteUtils.pop(),
            child: Icon(
              Utils.isAR ? FontAwesomeIcons.chevronRight : FontAwesomeIcons.chevronLeft,
              color: color ?? AppColors.black,
              size: 20.height,
            ),
          ),
        ),
      ),
    );
  }
}
