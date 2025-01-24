import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jahzha_app/core/helpers/dimensions.dart';
import 'package:lottie/lottie.dart';

import '../core/helpers/app_colors.dart';
import '../core/route_utils/route_utils.dart';
import 'basic_card_decoration.dart';

class AppLoadingIndicator extends StatelessWidget {
  const AppLoadingIndicator({
    super.key,
    this.padding,
    this.unconstrained = false,
  });

  final EdgeInsetsGeometry? padding;
  final bool unconstrained;

  static bool _isVisible = false;

  static bool get isVisible => _isVisible;

  static Future<void> show() async {
    if (_isVisible) {
      RouteUtils.pop();
    }
    _isVisible = true;
    await Future.delayed(Duration(milliseconds: 50));
    showDialog(
      context: RouteUtils.context,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.7),
      builder: (context) {
        return UnconstrainedBox(
          child: Lottie.asset(
            'assets/lottie/loading.json',
            width: 120,
            height: 120,
          ),
        );
      },
    );
  }

  static Future<void> hide() async {
    if (!_isVisible) {
      return;
    }
    RouteUtils.pop();
    _isVisible = false;
    await Future.delayed(Duration(milliseconds: 100));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Center(
        child: Builder(
          builder: (context) {
            if (unconstrained) {
              return UnconstrainedBox(
                child: _loadingIndicator(),
              );
            }
            return _loadingIndicator();
          },
        ),
      ),
    );
  }

  Widget _loadingIndicator() {
    return Material(
      color: Colors.transparent,
      child: BasicCard(
        radius: 12.radius,
        padding: _isVisible ? EdgeInsets.all(32.width) : EdgeInsets.zero,
        color: _isVisible ? AppColors.white : Colors.transparent,
        child: Lottie.asset(
          'assets/lottie/loading.json',
          width: 80,
          height: 80,
        ),
      ),
    );
  }
}
