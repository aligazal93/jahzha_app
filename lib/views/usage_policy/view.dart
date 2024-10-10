import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/widgets/app/app_bar.dart';
import 'package:jahzha_app/widgets/app_text.dart';

class UsagePolicyView extends StatelessWidget {
  const UsagePolicyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Usage policy'.tr(),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 16),
        children: [
          AppText(
            title: 'هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة',
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.secondary,
            textAlign: TextAlign.center,
            height: 26,
          ),
          AppText(
            title: 'هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها. ولذلك يتم استخدام طريقة لوريم إيبسوم لأنها تعطي توزيعاَ طبيعياَ -إلى حد ما- للأحرف عوضاً عن استخدام "هنا يوجد محتوى نصي، هنا يوجد محتوى نصي" فتجعلها تبدو (أي الأحرف) وكأنها نص مقروء. العديد من برامح النشر المكتبي وبرامح تحرير صفحات الويب تستخدم لوريم إيبسوم بشكل إفتراضي كنموذج عن النص، وإذا قمت بإدخال "lorem ipsum" في أي محرك بحث ستظهر العديد من المواقع الحديثة العهد في نتائج البحث. على مدى السنين ظهرت نسخ جديدة ومختلفة من نص لوريم إيبسوم، أحياناً عن طريق الصدفة، وأحياناً عن عمد كإدخال بعض العبارات الفكاهية إليها.',
            color: AppColors.txtGray,
            height: 24,
            fontSize: 14,
            textAlign: TextAlign.center,
            padding: EdgeInsets.all(12),
            fontWeight: FontWeight.w500,
          )
        ],
      ),
    );
  }
}
