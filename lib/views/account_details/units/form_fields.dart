part of '../view.dart';

class _FormFields extends StatefulWidget {
  _FormFields({Key? key}) : super(key: key);

  @override
  State<_FormFields> createState() => _FormFieldsState();
}

class _FormFieldsState extends State<_FormFields> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountDetailsCubit, AccountDetailsStates>(
      builder: (context, state) {
        final cubit = AccountDetailsCubit.of(context);
        return Form(
          key: cubit.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTextField(
                suffixIcon: Utils.isAR ? Padding(
                  padding: EdgeInsetsDirectional.symmetric(horizontal: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText(
                        title: '+966',
                        color: AppColors.lightGray,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ],
                  ),
                ) : null,
                prefixIcon: !Utils.isAR ? Padding(
                  padding: EdgeInsetsDirectional.symmetric(horizontal: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText(
                        title: '+966',
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: AppColors.lightGray,
                      ),
                    ],
                  ),
                ) : null,
                label: 'Mobile number'.tr(),
                textAlign: Utils.isAR ? TextAlign.end : TextAlign.start,
                controller: cubit.phoneTXController,
                inputType: TextInputType.phone,
                fillColor: AppColors.whiteBk,
                validator: Validator.phone,
                maxLength: 9,
              ),
              AppTextField(
                label: 'email Address'.tr(),
                fillColor: AppColors.whiteBk,
                inputType: TextInputType.emailAddress,
                controller: cubit.emailTXController,
                validator: Validator.email,
                suffixIcon: Image.asset('assets/images/edit.png'),
              ),
              AppTextField(
                label: 'full name'.tr(),
                controller: cubit.nameTXController,
                validator: Validator.name,
                fillColor: AppColors.whiteBk,
              ),
              // DatePicker(
              //   hint: CachingUtils.user?.data.birthdate == null ? 'Select your date of birth'.tr() : Utils.formatDate(CachingUtils.user?.data.birthdate!),
              //   upperText: "date of birth".tr(),
              //   onPick: (v) {
              //     cubit.birthdate = Utils.formatDate(v);
              //   },
              // ),
              AppTextField(
                label: 'date of birth'.tr(),
                validator: Validator.empty,
                controller: cubit.birthdateTXController,
                suffixIcon:Icon(FontAwesomeIcons.calendarDay,size: 20,color: AppColors.primary,) ,
                onTap: cubit.selectBirthdate,
              ),
              AppText(
                title: 'Gender'.tr(),
                color: AppColors.secondary,
                fontSize: 18,
                fontWeight: FontWeight.w500,
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Builder(
                  builder: (context) {
                    final isMale = cubit.genderTXController.text == 'male';
                    return Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              cubit.toggleGender('male');
                            },
                            child: Container(
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: AppColors.white,
                                  border: Border.all(
                                      color: isMale ? AppColors.primary : AppColors.txtGray),),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(FontAwesomeIcons.person,color: isMale ? AppColors.primary : AppColors.secondary,size: 20,),
                                  SizedBox(width: 4,),
                                  AppText(
                                    textAlign: TextAlign.center,
                                    title: 'Male'.tr(),
                                    fontSize: 18,
                                    color: isMale
                                        ? AppColors.primary
                                        : AppColors.secondary,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => cubit.toggleGender('female'),
                            child: Container(
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: AppColors.white,
                                  border: Border.all(
                                      color: !isMale
                                          ? AppColors.primary
                                          : AppColors.txtGray)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                  FontAwesomeIcons.personDress,
                                  color: !isMale
                                      ? AppColors.primary
                                      : AppColors.secondary,
                                  size: 20,
                                ),
                                SizedBox(width: 4,),
                                  AppText(
                                    textAlign: TextAlign.center,
                                    title: 'Female'.tr(),
                                    fontSize: 18,
                                    color: !isMale ? AppColors.primary : AppColors.secondary,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                ),
              ),
              // AppDropDownMenu(
              //     hint: 'المملكة العربية السعودية',
              //     fillColor: AppColors.whiteBk,
              //     onChange: (p0) {},
              //     label: 'Nationality'.tr(),
              //     items: [
              //       'المملكة العربية السعودية',
              //       'المملكة العربية السعودية'
              //     ]),
            ],
          ),
        );
      },
    );
  }
}
