import 'package:flutter/cupertino.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodeCard extends StatelessWidget {
  const QRCodeCard({Key? key, required this.data, this.size}) : super(key: key);

  final String data;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: QrImageView(
        data: data,
        version: QrVersions.auto,
        backgroundColor: AppColors.whiteBk,
        padding: EdgeInsets.all(16),
        size: size,
      ),
    );
  }
}
