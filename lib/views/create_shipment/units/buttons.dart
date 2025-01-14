part of '../view.dart';

class _Buttons extends StatelessWidget {
  const _Buttons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = CreateShipmentCubit.of(context);
    final currentPage = cubit.currentPage;
    final pageController = cubit.pageController;
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: Platform.isIOS ? 0 : 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (currentPage < 2)
              Expanded(
                child: AppButton(
                  titleFontSize: 14,
                  padding: EdgeInsets.zero,
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  constrainedAxis: Axis.horizontal,
                  title: 'Next'.tr(),
                  onTap: () {
                    pageController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  },
                ),
              ),
            if (currentPage == 2)
              Expanded(
                child: AppButton(
                  titleFontSize: 14,
                  padding: EdgeInsets.zero,
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  constrainedAxis: Axis.horizontal,
                  title: 'add to cart'.tr(),
                  onTap: () {
                    pageController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                    RouteUtils.navigateTo(CartPageView());
                  },
                ),
              ),
            if (currentPage > 0)
              Expanded(
                child: AppButton(
                  titleFontSize: 14,
                  padding: EdgeInsets.zero,
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  constrainedAxis: Axis.horizontal,
                  color: AppColors.darkGrayBlue,
                  titleColor: AppColors.txtGray,
                  title: 'Previous'.tr(),
                  onTap: () {
                    pageController.previousPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
