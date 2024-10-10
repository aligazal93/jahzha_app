import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/core/helpers/utils.dart';
class RateWidget extends StatelessWidget {
  final double rate;
  final void Function(double)? onRate;
  final double itemSize;
  final double hItemPadding;
  final double vItemPadding;

  RateWidget(
      {required this.rate,
      this.onRate,
      this.itemSize = 16,
      this.hItemPadding = 0.0,
      this.vItemPadding = 0});

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: Utils.isAR ? 2 : 0,
      child: RatingBar(
        initialRating: rate,
        direction: Axis.horizontal,
        allowHalfRating: false,
        textDirection: TextDirection.ltr,
        itemCount: 5,
        itemSize: itemSize,
        ignoreGestures: onRate == null,
        ratingWidget: RatingWidget(
          full: _buildIcon(FontAwesomeIcons.solidStar),
          half: _buildIcon(Icons.star_half_rounded),
          empty: _buildIcon(FontAwesomeIcons.star),
        ),
        itemPadding: EdgeInsets.symmetric(
            horizontal: hItemPadding, vertical: vItemPadding),
        onRatingUpdate: onRate == null ? (_) {} : onRate!,
      ),
    );
  }

  Widget _buildIcon(IconData icon) => RotatedBox(
        quarterTurns: Utils.isAR ? 2 : 0,
        child: Icon(
          icon,
          color: AppColors.yellow,
        ),
      );
}
