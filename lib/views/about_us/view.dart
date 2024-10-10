import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/widgets/app/app_bar.dart';
import 'package:jahzha_app/widgets/app_text.dart';
part 'units/about_card.dart';

class AboutsUsView extends StatelessWidget {
  const AboutsUsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'about us'.tr(),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 12,horizontal: 12),
        children: [
          AppText(
            title: 'هي منصة شحن عالمية تتيح لك مقارنة أسعار شركات الشحن المختلفة وحجز شحناتك بسهولة. نعمل مع مجموعة واسعة من شركات الشحن ، بما في ذلك DHL و UPS و FedEx ، حتى تتمكن من العثور على أفضل سعر لاحتياجاتك.',
            fontSize: 14,
            color: AppColors.txtGray,
            textAlign: TextAlign.center,
            height: 24,
            fontWeight: FontWeight.w500,
          ),
          AppText(
            title: 'Why charge with jahzha'.tr(),
            color: AppColors.primary,
            fontSize: 16,
            fontWeight: FontWeight.w700,
            padding: EdgeInsets.symmetric(vertical: 16),
            textAlign: TextAlign.center,
          ),
          AboutCard(
           image: 'assets/images/microphone.png',
           title: 'العملاء أولاً',
           content: 'نضع احتياجات عملائنا دائمًا في المقام الأول.',
          ),
          AboutCard(
            image: 'assets/images/medal.png',
            title: 'الصدق والابتكار',
            content: 'نحن ملتزمون بالصدق والشفافية في جميع تفاعلاتنا.'
          ),
          AboutCard(
              image: 'assets/images/group.png',
              title: 'العمل الجماعي',
            content: 'نؤمن بقوة العمل الجماعي ونعمل معًا لتحقيق أهدافنا المشتركة.',
          ),


        ],
      ),
    );
  }
}
