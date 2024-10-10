import 'package:dotted_line/dotted_line.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/core/helpers/dimensions.dart';
import 'package:jahzha_app/core/route_utils/route_utils.dart';
import 'package:jahzha_app/widgets/app_text.dart';

class SolidAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SolidAppBar({Key? key,  this.title, this.currentPage}) : super(key: key);
  final String? title;
  final int? currentPage;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        decoration: BoxDecoration(
          color: Color(0XFF0F122C),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25)
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(title: title ?? "",
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: AppColors.white,
                ),
                InkWell(
                  onTap: () {
                    RouteUtils.pop();
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Color(0XFF02062B),
                        borderRadius: BorderRadius.circular(150)
                    ),
                    child: Icon(FontAwesomeIcons.arrowLeftLong,size: 20,color: AppColors.txtGray,),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(FontAwesomeIcons.solidCircleCheck,color: AppColors.primary ),
                          AppText(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            title: 'Shipment details'.tr(),
                            color:AppColors.primary,
                            fontSize: 10,
                          )
                        ],
                      ),),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: DottedLine(
                        dashColor: Color(0XFF606487),
                        lineThickness: 1.5,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Icon(FontAwesomeIcons.solidCircleCheck,color: currentPage == 1 || currentPage == 2 ? AppColors.primary : Color(0XFF606487),),
                        AppText(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          title: 'Sending side'.tr(),
                          color: currentPage == 1 || currentPage == 2 ? AppColors.primary : Color(0XFF606487),
                          fontSize: 10,
                        )
                      ],
                    ),),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: DottedLine(
                        dashColor: Color(0XFF606487),
                        lineThickness: 1.5,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Icon(FontAwesomeIcons.solidCircleCheck,color: currentPage == 2 ? AppColors.primary : Color(0XFF606487),),
                        AppText(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          title: 'Receiving destination'.tr(),
                          color:currentPage == 2 ? AppColors.primary : Color(0XFF606487),
                          fontSize: 10,
                        )
                      ],
                    ),),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  @override
  Size get preferredSize => Size(AppBar().preferredSize.width,250.height);
}
