import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jahzha_app/core/datasources/cart.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/core/helpers/dimensions.dart';
import 'package:jahzha_app/core/route_utils/route_utils.dart';
import 'package:jahzha_app/views/cart/view.dart';
import 'package:jahzha_app/widgets/app_text.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    Key? key,
    required this.title,
    required this.name,
  }) : super(key: key);
  final String? title, name;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        color: AppColors.white,
        height: 100,
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    title: title ?? "",
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: AppColors.secondary,
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  AppText(
                    title: name ?? "",
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: AppColors.secondary,
                  ),
                ],
              ),
            ),
            CartButton(),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(AppBar().preferredSize.width, 100.height);
}

class CartButton extends StatelessWidget {
  const CartButton({Key? key}) : super(key: key);

  static final _streamController = StreamController<bool>.broadcast();

  static void refreshCount() {
    _streamController.add(true);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _streamController.stream,
      builder: (context, snapshot) => FutureBuilder<int>(
        initialData: 0,
        future: CartDatasource().getCartCount(),
        builder: (context, snapshot) {
          return InkWell(
            onTap: () => RouteUtils.navigateTo(CartPageView()),
            child: Stack(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: AppColors.tGray,
                    borderRadius: BorderRadius.circular(150),
                  ),
                  child: Icon(
                    FontAwesomeIcons.bagShopping,
                    size: 20,
                    color: AppColors.secondary,
                  ),
                ),
                if (snapshot.data != 0)
                  PositionedDirectional(
                    top: 0,
                    start: 0,
                    child: Container(
                      padding: EdgeInsets.all(6),
                      child: AppText(
                        title: snapshot.data!.toString(),
                        color: AppColors.white,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
