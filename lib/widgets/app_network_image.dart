import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../core/helpers/app_colors.dart';
import '../core/helpers/utils.dart';
import 'app_loading_indicator.dart';

class AppNetworkImage extends StatelessWidget {
  final String url;
  final BoxFit fit;
  final double? height, width;
  final double? borderRadius;
  final Alignment? alignment;
  final Color? borderColor;
  final Color? bgColor;
  final BoxShape? shape;
  final Widget? child;

  AppNetworkImage({
    required this.url,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
    this.borderRadius,
    this.alignment,
    this.borderColor,
    this.bgColor,
    this.shape,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    if (url.endsWith('.svg')) {
      return Container(
        width: width,
        height: height,
        margin: EdgeInsets.symmetric(vertical: 0),
        child: SvgPicture.network(
          url,
          width: width,
          height: height,
          fit: fit,
          alignment: alignment ?? Alignment.center,
          placeholderBuilder: (_) => _loading(),
        ),
        decoration: decoration,
        alignment: alignment ?? Alignment.center,
      );
    }
    return CachedNetworkImage(
        cacheKey: url,
        imageUrl: url,
        width: width,
        height: height,
        imageBuilder: (context, imageProvider) {
          return Container(
            width: width,
            height: height,
            margin: EdgeInsets.symmetric(vertical: 0),
            child: child,
            decoration: decoration.copyWith(
              image: DecorationImage(
                image: imageProvider,
                fit: fit,
              ),
            ),
            alignment: alignment ?? Alignment.center,
          );
        },
        // placeholder: ( _) => _loading(),
    errorWidget: (context, url, error) {
    return Container(
    child: Icon(
    FontAwesomeIcons.circleExclamation,
    color: AppColors.yellow,
    size: height != null ? height! / 3 : null,
    ),
    decoration: decoration,
    );
    },
    );
  }

  Widget _loading() {
    return UnconstrainedBox(
      child: CircularProgressIndicator(
        strokeWidth: 1.5,
        color: AppColors.primary,
      ),
    );
  }

  BoxDecoration get decoration {
    return BoxDecoration(
      color: bgColor,
      borderRadius: shape == null
          ? BorderRadius.circular(borderRadius ?? 5)
          : null,
      shape: shape ?? BoxShape.rectangle,
      border: Border.all(
        color: borderColor ?? Colors.transparent,
        width: 1,
      ),
    );
  }
}