import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/core/helpers/utils.dart';
import 'package:jahzha_app/core/media_manager/media_manager.dart';

class ImagePickerWidget extends StatelessWidget {
  const ImagePickerWidget({
    Key? key,
    this.height = 78,
    this.width = 78,
    required this.onImagePicked,
    required this.onImageRemoved,
    this.image,
    this.expanded = false,
    this.vMargin = 0,
    this.hMargin = 0,
  }) : super(key: key);

  final double? height;
  final double? width;
  final Function(File) onImagePicked;
  final Function(File) onImageRemoved;
  final File? image;
  final bool expanded;
  final double vMargin;
  final double hMargin;

  @override
  Widget build(BuildContext context) {
    if (expanded) {
      return ImagePickerWidget(
        onImagePicked: onImagePicked,
        onImageRemoved: onImageRemoved,
        width: width,
        height: height,
        image: image,
        vMargin: vMargin,
        hMargin: hMargin,
        key: key,
      );
    }
    return InkWell(
      onTap: () async {
        if (image != null) {
          onImageRemoved(image!);
          return;
        }
        final file = await MediaManager.showImageDialog();
        if (file != null) {
          onImagePicked(file);
        }
      },
      borderRadius: BorderRadius.circular(10),
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: vMargin,
          horizontal: hMargin,
        ),
        padding: EdgeInsets.all(10),
        alignment: Alignment.center,
        height: height,
        width: width,
        child: Icon(
          size: 44,
          image == null ? FontAwesomeIcons.camera : FontAwesomeIcons.trashCan,
          color: image == null ? AppColors.primary.theme : AppColors.red,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
          image: image == null ? DecorationImage(
            image: AssetImage(Utils.getAssetPNGPath('rectangle_dots' + (height == 78 ? '' : ''))),
            fit: BoxFit.fill,
          ) : DecorationImage(
            image: FileImage(image!),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}