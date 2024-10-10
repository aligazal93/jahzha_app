part of '../view.dart';
class ShipCard extends StatelessWidget {
  const ShipCard({Key? key, required this.index, required this.title}) : super(key: key);
  final int index;
  final String title;
  @override
  Widget build(BuildContext context) {
    final cubit = MyShipmentsCubit.of(context);
    final isActive = index == cubit.currentIndex;
    return Expanded(
      child: InkWell(
        onTap: () => cubit.toggleTab(index),
        child: Container(
          padding: EdgeInsets.all(14),
          margin: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
              color: isActive ? AppColors.primary : AppColors.lightGray.withOpacity(.1),
              border: Border.all(
                color: AppColors.tGray,
              ),
              borderRadius: BorderRadius.circular(22)
          ),
          child: AppText(
            textAlign: TextAlign.center,
            title: title,
            color: isActive ? AppColors.white : AppColors.txtGray,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
