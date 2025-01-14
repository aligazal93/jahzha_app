part of '../view.dart';

class _Buttons extends StatelessWidget {
  const _Buttons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = CreateShipmentCubit.of(context);
    final currentPage = cubit.currentPage;
    return Padding(
      padding: EdgeInsets.only(
        top: 20,
        bottom: Platform.isIOS ? 0 : 20,
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: 20),
            if (currentPage > 0) ...[
              Expanded(
                child: AppButton(
                  titleFontSize: 14,
                  padding: EdgeInsets.zero,
                  constrainedAxis: Axis.horizontal,
                  color: AppColors.darkGrayBlue,
                  titleColor: AppColors.txtGray,
                  title: 'Previous'.tr(),
                  onTap: cubit.previousPage,
                ),
              ),
              SizedBox(width: 16),
            ],
            if (currentPage < 2)
              Expanded(
                child: AppButton(
                  titleFontSize: 14,
                  padding: EdgeInsets.zero,
                  constrainedAxis: Axis.horizontal,
                  title: 'Next'.tr(),
                  onTap: cubit.nextPage,
                ),
              ),
            if (currentPage == 2)
              Expanded(
                child: AppButton(
                  titleFontSize: 14,
                  padding: EdgeInsets.zero,
                  constrainedAxis: Axis.horizontal,
                  title: 'add to cart'.tr(),
                  onTap: cubit.addToCart,
                ),
              ),
            SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}
