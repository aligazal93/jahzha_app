part of '../view.dart';

class _TabBar extends StatelessWidget {
  const _TabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _tab(
          title: 'Order status'.tr(),
          index: 0,
        ),
        _tab(
          title: 'Order details'.tr(),
          index: 1,
        ),
        _tab(
          title: 'order tracking'.tr(),
          index: 2,
        ),
      ],
    );
  }

  Widget _tab({
    required int index,
    required String title,
  }) {
    final isActive = false;
    return Expanded(
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
    );
  }
}
