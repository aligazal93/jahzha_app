import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/views/my_shipments/units/boxCard.dart';
import 'package:jahzha_app/widgets/app_text.dart';

class FinishedPage extends StatelessWidget {
  const FinishedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(height: 12,),
        itemCount: 3,
        padding: const EdgeInsets.all(8.0),
        itemBuilder: (context, index) {
          return BoxCard(
            boxId: '#554554545',
            type: 'صندوق',
            address: 'الامارات , دبي',
            method: 'شاحنة',
            titleDelivered: 'التسليم فى 10 - 11 ابريل',
            statues: 'sent delivered handed'.tr(),
            colorStatue: AppColors.green,
          );
        },
      ),
    );
  }
}
