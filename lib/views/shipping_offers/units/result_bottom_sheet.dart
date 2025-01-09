part of '../view.dart';

class ResultBottomSheetView extends StatelessWidget {
  ResultBottomSheetView({Key? key, required this.cubit}) : super(key: key);

  final ShippingOffersCubit cubit;

  @override
  Widget build(BuildContext context) {
    final dto = cubit.dto;
    return BlocBuilder(
      bloc: cubit,
      builder: (context, state) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppText(
                title: 'Filter results'.tr(),
                color: AppColors.secondary,
                fontWeight: FontWeight.w500,
                fontSize: 14,
                padding: EdgeInsets.symmetric(vertical: 12),
              ),
              Divider(
                thickness: 4,
                color: AppColors.secondary,
                endIndent: 130,
                indent: 130,
              ),
              AppDropDownMenu(
                fillColor: AppColors.tGray,
                label: 'reorder_result'.tr(),
                value: dto.filterPriceInDescendingOrder == null
                    ? null
                    : dto.filterPriceInDescendingOrder!
                        ? 'expensive_first'.tr()
                        : 'cheapest_first'.tr(),
                onChange: (v) {
                  dto.filterPriceInDescendingOrder = v == 'expensive_first'.tr;
                  cubit.updateUI();
                },
                items: ['cheapest_first'.tr(), 'expensive_first'.tr()],
              ),
              Builder(
                builder: (context) {
                  final isSelected = dto.orderByFastest ?? false;
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.blueLight),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              dto.orderByFastest = !isSelected;
                              cubit.updateUI();
                            },
                            child: AnimatedContainer(
                              duration: Duration(microseconds: 5000),
                              height: 30,
                              width: 30,
                              curve: Curves.bounceInOut,
                              margin: EdgeInsets.symmetric(vertical: 10),
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: AppColors.darkGray.theme,
                                ),
                                color: isSelected
                                    ? AppColors.primary
                                    : AppColors.darkGrayBlue,
                              ),
                              child: Icon(
                                FontAwesomeIcons.check,
                                color: AppColors.white.theme,
                                size: 12,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.rocket,
                                size: 20,
                                color: AppColors.blue,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              AppText(
                                title: 'fastest'.tr(),
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                color: AppColors.blue,
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
              Builder(
                builder: (context) {
                  final isSelected = dto.orderByNewest ?? false;
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.orangeLight),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              dto.orderByNewest = !isSelected;
                              cubit.updateUI();
                            },
                            child: AnimatedContainer(
                              duration: Duration(microseconds: 5000),
                              height: 30,
                              width: 30,
                              curve: Curves.bounceInOut,
                              margin: EdgeInsets.symmetric(vertical: 10),
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: AppColors.darkGray.theme,
                                ),
                                color: isSelected
                                    ? AppColors.primary
                                    : AppColors.darkGrayBlue,
                              ),
                              child: Icon(
                                FontAwesomeIcons.check,
                                color: AppColors.white.theme,
                                size: 12,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.star,
                                size: 20,
                                color: AppColors.primary,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              AppText(
                                title: 'new'.tr(),
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                color: AppColors.primary,
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 24),
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: AppButton(
                        onTap: dto.isFilterApplied ? () {
                          cubit.filterOffers();
                          RouteUtils.pop();
                        } : null,
                        title: 'Show results'.tr(),
                        constrainedAxis: Axis.horizontal,
                        color: AppColors.primary,
                      ),
                    ),
                    if (dto.isFilterApplied) ...[
                      SizedBox(width: 8),
                      InkWell(
                        onTap: () {
                          cubit.resetFilters();
                          RouteUtils.pop();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Icon(
                            FontAwesomeIcons.rotate,
                            color: AppColors.white,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
