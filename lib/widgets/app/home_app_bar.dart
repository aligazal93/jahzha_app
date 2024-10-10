import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/core/helpers/dimensions.dart';
import 'package:jahzha_app/core/route_utils/route_utils.dart';
import 'package:jahzha_app/views/cart/view.dart';
import 'package:jahzha_app/widgets/app_text.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({Key? key, required this.title,required this.name,required this.icon}) : super(key: key);
  final String? title,name;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        color: AppColors.white,
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment:  MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(title: title ?? "",
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: AppColors.secondary,
                ),
                SizedBox(height: 7,),
                AppText(title: name ?? "",
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: AppColors.secondary,
                ),

              ],
            ),
            InkWell(
              onTap: () {
                RouteUtils.navigateTo(CartPageView());
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: AppColors.tGray,
                    borderRadius: BorderRadius.circular(150)
                ),
                child: Icon(icon,size: 20,color: AppColors.secondary,),
              ),
            )
          ],
        ),
      ),
    );
  }
  @override
  Size get preferredSize => Size(AppBar().preferredSize.width,100.height);
}
