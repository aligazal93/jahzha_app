part of '../view.dart';
class _ConfirmButton extends StatelessWidget {
  const _ConfirmButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 26),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: AppButton(
              title: 'save'.tr(),
              color: AppColors.primary,
              constrainedAxis: Axis.horizontal,
              padding: EdgeInsets.zero,
              titleFontSize: 16,
              onTap: () {},
            ),
            flex: 2,
          ),
          SizedBox(width: 4,),
          Expanded(
            child: AppButton(
              title: 'cancel'.tr(),
              color: AppColors.txtGray,
              constrainedAxis: Axis.horizontal,
              titleFontSize: 16,
              padding: EdgeInsets.zero,
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
