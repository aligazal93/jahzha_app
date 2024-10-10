part of '../view.dart';
class _FormFields extends StatefulWidget {
  _FormFields({Key? key}) : super(key: key);

  @override
  State<_FormFields> createState() => _FormFieldsState();
}

class _FormFieldsState extends State<_FormFields> {
  String? _selectedGender = 'Male';
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountDetailsCubit,AccountDetailsStates>(
      builder: (context, state) {
        final cubit = AccountDetailsCubit.of(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextField(
              label: 'Mobile number'.tr(),
              enabled: false,
              fillColor: AppColors.whiteBk,
              onTap: () {
                cubit.showChangeNumberSheet();
              },
              suffixIcon: Image.asset('assets/images/edit.png'),
              hint: '66565555000',
            ),
            AppTextField(
              label: 'email Address'.tr(),
              fillColor: AppColors.whiteBk,
              suffixIcon: Image.asset('assets/images/edit.png'),
              hint: 'info@gmail.com',
            ),
            Row(
              children: [
                Expanded(
                  child: AppTextField(
                    label: 'First Name'.tr(),
                    hint: 'Mohamed',
                    fillColor: AppColors.whiteBk,
                  ),
                ),
                Expanded(
                  child: AppTextField(
                    label: 'family name'.tr(),
                    fillColor: AppColors.whiteBk,
                    hint: 'Ahmed',
                  ),
                ),

              ],
            ),
            AppTextField(
              validator: Validator.empty,
              onTap: cubit.selectDate,
              label: 'date of birth'.tr(),
              suffixIcon: Icon(FontAwesomeIcons.calendarDays,color: AppColors.primary,),
              fillColor: AppColors.whiteBk,
            ),
            AppText(
             title: 'Gender'.tr(),
              color: AppColors.secondary,
              fontSize: 18,
              fontWeight: FontWeight.w500,
              padding: EdgeInsets.symmetric(vertical: 8,horizontal: 12),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _selectedGender = 'Male'.tr();
                          print(_selectedGender);
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color:  AppColors.white,
                            border: Border.all(
                                color:_selectedGender == 'Male'.tr() ? AppColors.primary : AppColors.txtGray
                            )
                        ),
                        child: AppText(
                          textAlign: TextAlign.center,
                          title: 'Male'.tr(),
                          fontSize: 18,
                          color: _selectedGender == 'Male'.tr() ? AppColors.primary : AppColors.secondary,

                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12,),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _selectedGender = 'Female'.tr();
                          print(_selectedGender);
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color:  AppColors.white,
                            border: Border.all(
                                color:_selectedGender == 'Female'.tr() ? AppColors.primary : AppColors.txtGray
                            )
                        ),
                        child: AppText(
                          textAlign: TextAlign.center,
                          title: 'Female'.tr(),
                          fontSize: 18,
                          color: _selectedGender == 'Female'.tr() ? AppColors.primary : AppColors.secondary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            AppDropDownMenu(
                hint: 'المملكة العربية السعودية',
                fillColor: AppColors.whiteBk,
                onChange: (p0) {},
                label: 'Nationality'.tr(),
                items: [
                  'المملكة العربية السعودية',
                  'المملكة العربية السعودية'
                ]),
          ],
        );
      },
    );
  }
}
