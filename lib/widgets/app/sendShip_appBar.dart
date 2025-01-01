import 'package:dotted_line/dotted_line.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/core/helpers/dimensions.dart';
import 'package:jahzha_app/core/helpers/utils.dart';
import 'package:jahzha_app/core/route_utils/route_utils.dart';
import 'package:jahzha_app/widgets/app_text.dart';

class SendShipmentAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SendShipmentAppBar({Key? key,  this.title, this.currentPage}) : super(key: key);
  final String? title;
  final int? currentPage;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
        decoration: BoxDecoration(
            color: AppColors.primary,
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
              children: [
                InkWell(
                  onTap: () {
                    RouteUtils.pop();
                  },
                  child: Container(
                    height: 47,
                    width: 47,
                    decoration: BoxDecoration(
                        color: Color(0XFFD54A25),
                        borderRadius: BorderRadius.circular(150)
                    ),
                    child: Icon(Utils.isAR ? FontAwesomeIcons.arrowRightLong : FontAwesomeIcons.arrowLeftLong,size: 20,color: AppColors.white,),
                  ),
                ),
                SizedBox(width: 12,),
                AppText(title: title ?? "",
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: AppColors.white,
                ),
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(FontAwesomeIcons.solidCircleCheck,color: AppColors.white ),
                        AppText(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          textAlign: TextAlign.center,
                          title: 'Transmitter destination'.tr(),
                          color:AppColors.white,
                          fontSize: 12,
                        )
                      ],
                    ),
                    flex: 2,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: DottedLine(
                        dashColor: AppColors.whiteBk,
                        lineThickness: 1.5,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Icon(FontAwesomeIcons.solidCircleCheck,color: currentPage == 1 || currentPage == 2 ? AppColors.white : Color(0XFFFFAF95),),
                        AppText(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          textAlign: TextAlign.center,
                          title: 'Receiving destination'.tr(),
                          color: currentPage == 1 || currentPage == 2 ? AppColors.white : Color(0XFFFFAF95),
                          fontSize: 12,
                        )
                      ],
                    ),),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: DottedLine(
                        dashColor: AppColors.white,
                        lineThickness: 1.5,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Icon(FontAwesomeIcons.solidCircleCheck,color: currentPage == 2 ? AppColors.white : Color(0XFFFFAF95),),
                        AppText(
                          textAlign: TextAlign.center,
                          padding: EdgeInsets.symmetric(vertical: 20),
                          title: 'Shipment information'.tr(),
                          color:currentPage == 2 ? AppColors.white : Color(0XFFFFAF95),
                          fontSize: 12,
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
  Size get preferredSize => Size(AppBar().preferredSize.width,260.height);
}
