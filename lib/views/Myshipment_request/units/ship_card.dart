part of '../view.dart';

class _ShipCard extends StatelessWidget {
  const _ShipCard({Key? key, required this.index, required this.title}) : super(key: key);
  final int index;
  final String title;
  @override
  Widget build(BuildContext context) {
    final cubit = ShipmentRequestCubit.of(context);
    final isActive = index == cubit.currentIndex;
    return Expanded(
      child: Container(
        width: double.infinity,
        color: AppColors.secondary,
        child: InkWell(
          onTap: () => cubit.toggleTab(index),
          child: Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: isActive ? AppColors.primary : Colors.transparent,// Set your desired color
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
