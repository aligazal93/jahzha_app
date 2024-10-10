import 'package:flutter/material.dart';
import 'package:jahzha_app/widgets/app_text.dart';
import '../../core/helpers/app_colors.dart';
import '../../core/helpers/utils.dart';

class AppStepper extends StatelessWidget {
  const AppStepper({
    Key? key,
    required this.steps,
    required this.currentStep,
  }) : super(key: key);

  final List<String> steps;
  final int currentStep;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 24,
          right: 24,
          top: 24,
          child: Container(
            height: 1,
            width: double.infinity,
            color: AppColors.tGray,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: steps.map((e) {
            final index = steps.indexOf(e);
            return _step(
              title: e,
              active: (currentStep - 1) >= index,
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _step({
    required bool active,
    required String title,
  }) {
    return Expanded(
      child: Column(
        children: [
          Container(
            height: 48,
            width: 48,
            child: UnconstrainedBox(
              child: Image.asset(
                Utils.getAssetPNGPath(active ? 'car' : 'car'),
                height: 24,
                width: 24,
                color: active ? AppColors.white : AppColors.tGray,
              ),
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: active ? AppColors.secondary : AppColors.lightGray,
              border: active
                  ? Border.all(
                color: AppColors.secondary,
              )
                  : null,
            ),
          ),
          SizedBox(height: 12),
          FittedBox(
            child: AppText(
              title: title,
              fontSize: 12,
              color: active ? AppColors.black : AppColors.tGray,
            ),
          ),
        ],
      ),
    );
  }
}