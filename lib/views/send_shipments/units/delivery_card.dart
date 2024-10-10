part of '../view.dart';
class DeliveryCard extends StatelessWidget {
  const DeliveryCard({Key? key, required this.price, required this.deliveryType, this.onTap, required this.index}) : super(key: key);
  final String price,deliveryType;
  final Function(int)? onTap;
  final int index;
  @override
  Widget build(BuildContext context) {
    final cubit = SendShipmentCubit.of(context);
    final isActive = index == cubit.deliveryIndex;
    return InkWell(
      onTap: () => cubit.toggleTabDelivery(index),
      child: Container(
        margin: EdgeInsets.only(top: 12,bottom: 20,left: 4,right: 4),
        padding: EdgeInsets.symmetric(vertical: 14,horizontal: 0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                width: 1.5,
                color:isActive ? AppColors.primary : AppColors.tGray
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppText(
              title: 'price'.tr(),
              fontSize: 14,
              color: isActive ? AppColors.primary : AppColors.txtGray,
              fontWeight: FontWeight.w500,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                    title: price,
                    fontSize: 26,
                    color:  isActive ? AppColors.primary : AppColors.txtGray,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(width: 16,),
                  AppText(
                    title: 'SAR'.tr(),
                    fontSize: 14,
                    color: isActive ? AppColors.primary : AppColors.txtGray,
                    fontWeight: FontWeight.w500,
                  )
                ],
              ),
            ),
            AppText(
              title: deliveryType,
              fontSize: 10,
              color:  isActive ? AppColors.primary : AppColors.txtGray,
              fontWeight: FontWeight.w700,
            )

          ],
        ),
      ),
    );
  }
}
