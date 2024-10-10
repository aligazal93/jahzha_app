import 'package:flutter/material.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/core/route_utils/route_utils.dart';
class AppLoadingIndicator extends StatelessWidget {
  const AppLoadingIndicator();

  static bool _isVisible = false;
  static bool get isVisible => _isVisible;

  static Future<void> show() async {
    if (_isVisible) {
      RouteUtils.pop();
    }
    _isVisible = true;
    await Future.delayed(Duration(milliseconds: 50));
    await showDialog(
      context: RouteUtils.context,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.7),
      builder: (context) {
        return AppLoadingIndicator();
      },
    );
    _isVisible = false;
  }

  static Future<void> hide() async {
    if (!_isVisible) {
      return;
    }
    RouteUtils.pop();
    _isVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: 1.5,
        color: AppColors.primary,
      ),
    );
  }
}