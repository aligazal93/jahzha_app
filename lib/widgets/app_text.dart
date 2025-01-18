import 'package:flutter/material.dart';

import '../core/helpers/app_colors.dart';

enum AppFontFamily {
  alexandria(id: "Alexandria"),
  montserrat(id: "Montserrat");

  const AppFontFamily({required this.id});
  final String id;
}

class AppText extends StatelessWidget {
  final String title;
  final FontWeight fontWeight;
  final Color color;
  final double? fontSize;
  final TextAlign? textAlign;
  final TextDecoration? decoration;
  final TextOverflow? overflow;
  final int? maxLines;
  final bool? softWrap;
  final double? height;
  final AppFontFamily? fontFamily;
  final EdgeInsetsGeometry padding;
  final void Function()? onTap;

  AppText({
    Key? key,
    required this.title,
    this.color = AppColors.secondary,
    this.fontSize,
    this.textAlign,
    this.decoration,
    this.overflow,
    this.fontWeight = FontWeight.w500,
    this.maxLines,
    this.height,
    this.fontFamily,
    this.softWrap,
    this.padding = EdgeInsets.zero,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _fontSize = (fontSize ?? 14) - 2;
    return Padding(
      padding: padding,
      child: InkWell(
        onTap: onTap,
        child: Text(
          title,
          key: key,
          textAlign: textAlign ?? TextAlign.start,
          textScaler: TextScaler.linear(1),
          style: TextStyle(
            color: color,
            fontSize: _fontSize,
            height: height != null ? height! / _fontSize : null,
            decoration: decoration ?? TextDecoration.none,
            decorationStyle: TextDecorationStyle.solid,
            decorationThickness: 2,
            decorationColor: color,
            fontWeight: fontWeight,
            fontFamily: fontFamily == null ? null : fontFamily!.id,
          ),
          overflow: overflow,
          maxLines: maxLines,
          softWrap: softWrap,
        ),
      ),
    );
  }
}
