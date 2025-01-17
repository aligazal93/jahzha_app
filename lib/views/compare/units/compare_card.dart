part of '../view.dart';
class CompareCard extends StatelessWidget {
  const CompareCard({Key? key, required this.titleCard, required this.value1,
    required this.value2,
    this.fontSize = 11,
    this.color = AppColors.secondary, this.isSelected

  }) : super(key: key);
  final String titleCard,value1,value2;
  final double fontSize;
  final Color color;
  final bool? isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Row(
              children: [
                Expanded(
                  child: AppText(
                    title: titleCard,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.secondary,
                  ),
                ),
                if (isSelected != null)
                  Builder(
                    builder: (context) {
                      return Container(
                        padding: EdgeInsets.all(4),
                        child: Icon(
                          FontAwesomeIcons.check,
                          color: AppColors.white,
                          size: 14,
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isSelected! ? AppColors.primary : AppColors.darkGrayBlue,
                        ),
                      );
                    },
                  ),
              ],
            ),
            margin: EdgeInsets.only(top: 16),
            padding: EdgeInsets.all(16),
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12),
                    topLeft: Radius.circular(12)
                ),
                color: AppColors.tGray
            ),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(
                    color: AppColors.tGray
                )
            ),
            child: Row(
              children: [
                Expanded(
                  child: AppText(
                    title: value1,
                    fontSize: fontSize,
                    fontWeight: FontWeight.w700,
                    color: color,
                    padding: EdgeInsets.symmetric(horizontal: 8),
                  ),
                ),
                LineVertical(height: 60),
                Expanded(
                  child: AppText(
                    title: value2,
                    fontSize: fontSize,
                    fontWeight: FontWeight.w700,
                    color: color,
                    padding: EdgeInsets.symmetric(horizontal: 8),
                  ),
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}
