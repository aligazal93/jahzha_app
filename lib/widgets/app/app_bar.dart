import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/core/helpers/dimensions.dart';
import 'package:jahzha_app/core/helpers/utils.dart';
import 'package:jahzha_app/core/route_utils/route_utils.dart';
import 'package:jahzha_app/widgets/app_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key,  this.title,
    this.color = AppColors.white,
    this.titleColor = AppColors.secondary}) : super(key: key);
  final String? title;
  final Color color , titleColor;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        color: color,
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment:  MainAxisAlignment.center,
              children: [
                AppText(title: title ?? "",
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: titleColor,
                ),
              ],
            ),
            InkWell(
              onTap: () {
                RouteUtils.pop();
              },
              child: Container(
                height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: AppColors.tGray,
                    borderRadius: BorderRadius.circular(150)
                  ),
                  child: Icon(Utils.isAR ? FontAwesomeIcons.arrowLeftLong : FontAwesomeIcons.arrowRightLong,size: 20,),
              ),
            )
          ],
        ),
      ),
    );
  }
  @override
  Size get preferredSize => Size(AppBar().preferredSize.width,110.height);
}
