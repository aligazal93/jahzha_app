import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jahzha_app/core/helpers/dimensions.dart';

import '../core/helpers/app_colors.dart';
import '../core/route_utils/route_utils.dart';
import 'app_network_image.dart';

class ImageView extends StatefulWidget {
  const ImageView({Key? key, required this.url}) : super(key: key);

  final String url;

  void show() => RouteUtils.navigateTo(this);

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  int rotation = 0;
  int boxFitIndex = 0;

  List<BoxFit> boxFit = [
    BoxFit.fitWidth,
    BoxFit.fitHeight,
    BoxFit.contain,
    BoxFit.cover,
    BoxFit.fill,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () => setState(() => rotation--),
            icon: Icon(FontAwesomeIcons.arrowRotateRight),
            color: AppColors.black,
            iconSize: 16.width,
          ),
          IconButton(
            onPressed: () => setState(
                  () => (boxFitIndex + 1 == boxFit.length)
                  ? boxFitIndex = 0
                  : boxFitIndex++,
            ),
            icon: Icon(FontAwesomeIcons.image),
            color: AppColors.black,
            iconSize: 16.width,
          ),
          IconButton(
            onPressed: () => setState(() => rotation++),
            icon: Icon(FontAwesomeIcons.arrowRotateLeft),
            color: AppColors.black,
            iconSize: 16.width,
          ),
        ],
        leading: IconButton(
          onPressed: RouteUtils.pop,
          icon: Icon(Icons.close, color: AppColors.black),
        ),
      ),
      body: SizedBox(
        // alignment: Alignment.center,
        width: double.infinity,
        height: double.infinity,
        child: InteractiveViewer(
          child: RotatedBox(
            quarterTurns: rotation,
            child:
                // widget.panorama
                //     ? Panorama(
                //         child: _image,
                //       )
                //     :
                _image,
          ),
        ),
      ),
    );
  }

  AppNetworkImage get _image {
    return AppNetworkImage(
      url: widget.url,
      fit: boxFit[boxFitIndex],
    );
  }
}
