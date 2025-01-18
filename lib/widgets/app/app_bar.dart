import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/core/helpers/dimensions.dart';
import 'package:jahzha_app/core/helpers/utils.dart';
import 'package:jahzha_app/core/route_utils/route_utils.dart';
import 'package:jahzha_app/widgets/app_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.title,
    this.color = AppColors.white,
    this.titleColor = AppColors.secondary,
    this.margin,
    this.padding,
    this.actions = const [],
  }) : super(key: key);
  final String? title;
  final Color color, titleColor;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: margin ??
            EdgeInsets.symmetric(
              vertical: 16.height,
            ),
        padding: padding ?? EdgeInsets.symmetric(horizontal: 16.width),
        color: color,
        child: Row(
          children: [
            InkWell(
              onTap: RouteUtils.pop,
              child: Container(
                height: 42.width,
                width: 42.width,
                decoration: BoxDecoration(
                  color: AppColors.tGray,
                  borderRadius: BorderRadius.circular(150),
                ),
                child: Icon(
                  Utils.isAR
                      ? FontAwesomeIcons.arrowRightLong
                      : FontAwesomeIcons.arrowLeftLong,
                  size: 16,
                ),
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                    title: title ?? "",
                    fontWeight: FontWeight.w700,
                    fontSize: 12.font,
                    color: titleColor,
                  ),
                ],
              ),
            ),
            ...actions,
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(AppBar().preferredSize.height + 32.height);
}
