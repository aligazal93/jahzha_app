part of '../view.dart';
class MyCouponsCard extends StatelessWidget {
  const MyCouponsCard({Key? key, required this.color, required this.statue, required this.discount}) : super(key: key);
  final String statue , discount;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              color: AppColors.tGray
          )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              AppText(
                title: 'Discount coupon'.tr(),
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: AppColors.secondary,
              ),
              SizedBox(width: 10,),
              AppText(
                title: '( ${statue} )',
                fontSize: 16,
                color: color,
              ),
            ],
          ),
          AppText(
            title: '${discount}' + ' ' + 'discount'.tr(),
            color: AppColors.txtGray,
            fontSize: 16,
            padding: EdgeInsets.symmetric(vertical: 8),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 4),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                    color: AppColors.tGray
                ),
                color: AppColors.whiteBk
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(title: 'ASD FDSFS'),
                statue == 'valid'.tr() ? InkWell(
                    onTap: () {
                      Utils.copyToClipboard(context, 'ASD FDSFS');
                    },
                    child: Image.asset('assets/images/copy.png'),) : SizedBox()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
