part of '../view.dart';

class InfoBottomSheetView extends StatelessWidget {
  const InfoBottomSheetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Image.asset('assets/images/logo-h.png'),
          AppText(
            title: 'Home or work delivery service'.tr(),
            color: AppColors.txtGray,
            fontSize: 14,
            padding: EdgeInsets.symmetric(vertical: 12),
          ),
          AppText(
            title: 'Delivery within 14 to 20 days'.tr(),
            color: AppColors.txtGray,
            fontSize: 14,
            padding: EdgeInsets.symmetric(vertical: 4),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 6,
              itemBuilder: (context, index) {
                return AccordionCard(
                  title: 'هناك حقيقة مثبتة منذ زمن طويل',
                  content:
                      'هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
