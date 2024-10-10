part of '../view.dart';

class SenderDestination extends StatelessWidget {
  const SenderDestination({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 25,top: 0),
      child: ListView(
        children: [
          SizedBox(height: 12,),
          AppTextField(
            fillColor: AppColors.whiteBk,
            label: 'Sender full name'.tr(),
            inputType: TextInputType.number,
          ),
          AppTextField(
            fillColor: AppColors.whiteBk,
            label: 'email Address'.tr(),
            inputType: TextInputType.emailAddress,
          ),
          Stack(
            children: [
              Container(
                child: AppTextField(
                  label: 'Mobile number',
                  fillColor: AppColors.tGray,
                  vMargin: 20,
                  inputType: TextInputType.number,
                ),
              ),
              Positioned(
                  left: 10,
                  top: 44,
                  child: Container(
                    height: 70,
                    width: 90,
                    child: AppDropDownMenu(
                      fillColor: Colors.transparent,
                      items: [
                        '966',
                        '050',
                        '002'
                      ],
                      hint: '966+',
                      onChange: (p0) {},
                    ),
                  ))
            ],
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
