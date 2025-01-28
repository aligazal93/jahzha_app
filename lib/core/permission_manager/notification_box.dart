import 'package:flutter/material.dart';
import 'package:jahzha_app/core/network_utils/network_utils.dart';

import '../../widgets/app_text.dart';
import '../helpers/app_colors.dart';

class NotificationBox extends StatelessWidget {
  const NotificationBox({
    Key? key,
    required this.icon,
    required this.text,
    required this.onAccept,
    required this.onDeny,
  }) : super(key: key);

  final IconData icon;
  final String text;
  final Function() onAccept;
  final Function() onDeny;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFE7EBF6),
        border: Border.all(color: Color(0xFFE7EBF6)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 40),
              child: Center(
                  child: Icon(
                icon,
                color: AppColors.white,
              )),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: AppText(
                    title: text,
                    fontSize: 14,
                    height: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AppText(
                      title: Utils.isAR ? 'تفعيل' : 'Enable',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primary,
                      onTap: onAccept,
                    ),
                    SizedBox(width: 16),
                    AppText(
                      title: Utils.isAR ? 'لاحقا' : 'Later',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.secondary,
                      onTap: onDeny,
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(width: 12),
        ],
      ),
    );
  }
}
