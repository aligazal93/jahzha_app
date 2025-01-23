part of '../view.dart';

class _TabBar extends StatelessWidget {
  const _TabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = ShipmentDetailsCubit.of(context);
    return Row(
      children: [
        _tab(
          title: 'Order status'.tr(),
          isActive: cubit.currentViewIndex == 0,
          onTap: () => cubit.changeView(0),
        ),
        _tab(
          title: 'Order details'.tr(),
          isActive: cubit.currentViewIndex == 1,
          onTap: () => cubit.changeView(1),
        ),
        _tab(
          title: 'order tracking'.tr(),
          isActive: cubit.currentViewIndex == 2,
          onTap: () => cubit.changeView(2),
        ),
      ],
    );
  }

  Widget _tab({
    required bool isActive,
    required String title,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          color: AppColors.secondary,
          child: Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: isActive ? AppColors.primary : Colors.transparent,
                  // Set your desired color
                  width: 4.0, // Set the width of the border
                ),
              ),
            ),
            child: AppText(
              textAlign: TextAlign.center,
              title: title,
              color: isActive ? AppColors.white : AppColors.txtGray,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }
}
