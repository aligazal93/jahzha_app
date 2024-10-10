import 'package:flutter/material.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/widgets/app_text.dart';
class EmptyView extends StatelessWidget {
  final String title;

  const EmptyView({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppText(
        title: title,
        color: AppColors.primary,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        textAlign: TextAlign.center,
      ),
    );
  }
}
