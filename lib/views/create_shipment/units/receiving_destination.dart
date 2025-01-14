part of '../view.dart';

class _ReceiverPage extends StatelessWidget {
  const _ReceiverPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 25,top: 0),
      child: ListView(
        children: [
          SizedBox(height: 12,),
          AppTextField(
            fillColor: AppColors.whiteBk,
            label: 'Recipient full name'.tr(),
            inputType: TextInputType.number,
          ),
          AppTextField(
            fillColor: AppColors.whiteBk,
            label: 'email Address'.tr(),
            inputType: TextInputType.emailAddress,
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    child: AppTextField(
                      fillColor: AppColors.tGray,
                      hint: '5XXXXXXXXX',
                      label: 'Mobile number'.tr(),
                      textAlign: TextAlign.left,
                      inputType: TextInputType.number,
                      validator: Validator.phone,
                      maxLength: 9,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Container(
                      width: 70,
                      height: 60,
                      decoration: BoxDecoration(
                          color: AppColors.primary,
                          border: Border.all(
                            color: AppColors.darkGrayBlue,
                          ),
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                        child: AppText(
                          title: '966+',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white,
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          textAlign: TextAlign.center,
                        ),
                      )),
                ),
              ],
            ),
          ),
          AppDropDownMenu(
              fillColor: AppColors.whiteBk,
              onChange:(p0) {},
              items: [
                'Country',
                'Country',
              ],
              hint: '',
              label: 'Country'.tr()
          ),
          AppDropDownMenu(
              fillColor: AppColors.whiteBk,
              onChange:(p0) {},
              items: [
                'المدينة',
                'المدينة',
              ],
              hint: '',
              label: 'City'.tr()
          ),
          AppTextField(
            fillColor: AppColors.whiteBk,
            label: 'Street name'.tr(),
          ),
          AppTextField(
            fillColor: AppColors.whiteBk,
            label: 'Building name or number'.tr(),
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
      ),
    );
  }
}
