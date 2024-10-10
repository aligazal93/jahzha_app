part of '../view.dart';
class ResultBottomSheetView extends StatelessWidget {
   ResultBottomSheetView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8,horizontal: 12),
      child: Column(
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
              hint: 'ترتيب النتائج حسب : الاقل سعر اولآ',
              onChange: (p0) {},
              items: [
                'ترتيب النتائج حسب : الاقل سعر اولآ',
                'ترتيب النتائج حسب : الاقل سعر اولآ'
              ]),
          //TODO check Toggle
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4,vertical: 8),
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.orangeLight
            ),
            child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
            children: [
              GestureDetector(
                onTap:() {
                  // cubit.toggleTerms(cubit.isChecked);
                  // cubit.isChecked = !cubit.isChecked;
                },
                child: AnimatedContainer(duration: Duration(microseconds: 5000),
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
                      color: AppColors.primary
                  ),
                  child: Icon(FontAwesomeIcons.check,color: AppColors.white.theme,size: 12,) ,
                ),
              ),
              SizedBox(width: 12,),
              Row(
                children: [
                  Icon(FontAwesomeIcons.ticket,size: 20,color: AppColors.primary,),
                  SizedBox(width: 8,),
                  AppText(
                    title: 'saving'.tr(),
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
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4,vertical: 8),
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.blueLight
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  GestureDetector(
                    onTap:() {
                      // cubit.toggleTerms(cubit.isChecked);
                      // cubit.isChecked = !cubit.isChecked;
                    },
                    child: AnimatedContainer(duration: Duration(microseconds: 5000),
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
                          color: AppColors.primary
                      ),
                      child: Icon(FontAwesomeIcons.check,color: AppColors.white.theme,size: 12,) ,
                    ),
                  ),
                  SizedBox(width: 12,),
                  Row(
                    children: [
                      Icon(FontAwesomeIcons.rocket,size: 20,color: AppColors.blue,),
                      SizedBox(width: 8,),
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
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4,vertical: 8),
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.orangeLight
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  GestureDetector(
                    onTap:() {
                      // cubit.toggleTerms(cubit.isChecked);
                      // cubit.isChecked = !cubit.isChecked;
                    },
                    child: AnimatedContainer(duration: Duration(microseconds: 5000),
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
                          color: AppColors.primary
                      ),
                      child: Icon(FontAwesomeIcons.check,color: AppColors.white.theme,size: 12,) ,
                    ),
                  ),
                  SizedBox(width: 12,),
                  Row(
                    children: [
                      Icon(FontAwesomeIcons.star,size: 20,color: AppColors.primary,),
                      SizedBox(width: 8,),
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
          ),
          AppButton(
            onTap: () {},
            margin: EdgeInsets.symmetric(vertical: 8),
            title: 'Show results'.tr(),
            constrainedAxis: Axis.horizontal,
            color: AppColors.primary,
          )

        ],
      ),
    );
  }
}
