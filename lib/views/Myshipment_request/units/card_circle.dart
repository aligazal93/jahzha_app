
import 'package:flutter/material.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/widgets/app_text.dart';

class CircleCard extends StatelessWidget {
  const CircleCard({Key? key, required this.image, required this.title, required this.activeColor}) : super(key: key);
  final String image,title;
  final Color activeColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: activeColor
                  ),
                  borderRadius: BorderRadius.circular(120)
              ),
              child: Image.asset(image,color: activeColor,)),
          AppText(
            title: title,
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: activeColor,
          )
        ],
      ),
    );
  }
}
