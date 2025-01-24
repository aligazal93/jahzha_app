import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jahzha_app/core/helpers/dimensions.dart';

import '../core/helpers/app_colors.dart';
import '../core/helpers/utils.dart';

class EditUserAvatar extends StatelessWidget {
  const EditUserAvatar({super.key, this.onTap, this.image});

  final void Function()? onTap;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 96.width,
            height: 96.height,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: image == null
                    ? AssetImage(
                        Utils.getAssetPNGPath('default_avatar'),
                      )
                    : (image!.startsWith('http')
                        ? NetworkImage(image!)
                        : FileImage(File(image!)) as ImageProvider),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: InkWell(
              onTap: onTap,
              child: Container(
                width: 32.width,
                height: 32.height,
                child: Icon(
                  FontAwesomeIcons.camera,
                  color: AppColors.primary,
                  size: 16,
                ),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 2),
                      color: AppColors.lightGray,
                      blurRadius: 2,
                      spreadRadius: 0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
