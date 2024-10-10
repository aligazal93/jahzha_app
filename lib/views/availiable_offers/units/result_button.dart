part of '../view.dart';
class ResultButton extends StatelessWidget {
  const ResultButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<AvailableOffersCubit,AvailableOffersStates>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            showModalBottomSheet(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              context: RouteUtils.context,
              builder: (context) {
                return ResultBottomSheetView();
              },
            );
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 16),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColors.primary,
                )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(FontAwesomeIcons.sliders,color: AppColors.primary,size: 20,),
                AppText(
                  title: 'Filter results'.tr(),
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700,
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  fontSize: 16,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
