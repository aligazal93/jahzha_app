import 'package:flutter/material.dart';

import '../core/helpers/app_colors.dart';

class AppRefreshIndicator extends StatelessWidget {
  const AppRefreshIndicator({
    Key? key,
    required this.onRefresh,
    required this.child,
  }) : super(key: key);

  final Future<void> Function()? onRefresh;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (onRefresh == null) return child;
    return RefreshIndicator(
      color: AppColors.primary,
      onRefresh: onRefresh!,
      child: child,
    );
  }
}
