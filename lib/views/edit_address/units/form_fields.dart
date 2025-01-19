part of '../view.dart';

class _FormFields extends StatelessWidget {
  const _FormFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppDropDownMenu(
          validator: (p0) {},
          hint: '',
          fillColor: AppColors.whiteBk,
          items: [
            'السعودية',
          ],
          onChange: (p0) {},
          label: 'country'.tr(),
        ),
        AppDropDownMenu(
          validator: (p0) {},
          hint: '',
          fillColor: AppColors.whiteBk,
          items: [
            'الرياض',
          ],
          onChange: (p0) {},
          label: 'City'.tr(),
        ),
        AppTextField(
          fillColor: AppColors.whiteBk,
          label: 'Building name or number'.tr(),
        ),
        AppTextField(
          fillColor: AppColors.whiteBk,
          label: 'Street name'.tr(),
        ),
        AppTextField(
          fillColor: AppColors.whiteBk,
          label: 'Nearest landmark'.tr(),
        ),
        AppTextField(
          fillColor: AppColors.whiteBk,
          label: 'Senders zip code'.tr(),
        ),
      ],
    );
  }
}
