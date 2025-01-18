part of '../view.dart';
class SupportButton extends StatelessWidget {
  const SupportButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.width),
      margin: EdgeInsets.symmetric(vertical: 40.height),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(16.radius),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/support.png',width: 24,),
          AppText(
            padding: EdgeInsets.symmetric(horizontal: 16.width),
            textAlign: TextAlign.center,
            title: 'Support Center'.tr(),
            fontSize: 14.font,
            fontWeight: FontWeight.w700,
            color: AppColors.white,
          ),
        ],
      ),
    );
  }
}
