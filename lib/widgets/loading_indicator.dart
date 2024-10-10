import 'package:flutter/material.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({Key? key, this.vMargin = 0}) : super(key: key);

  final double vMargin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: vMargin),
      child: Center(
        child: CircularProgressIndicator(
          strokeWidth: 1,
          color: AppColors.primary,
        ),
      ),
    );
  }
}
