part of '../view.dart';

class _PendingMessage extends StatelessWidget {
  const _PendingMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = MyShipmentsCubit.of(context);
    if (cubit.pendingText?.trim().isEmpty ?? true) {
      return SizedBox();
    }
    return Column(
      children: [
        SizedBox(height: 2),
        Container(
          padding: EdgeInsets.all(12),
          child: AppText(
            title: cubit.pendingText!,
            color: AppColors.white,
            textAlign: TextAlign.center,
            height: 20,
          ),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
    );
  }
}
