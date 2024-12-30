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
                label: 'Mobile number'.tr(),
                controller: TextEditingController(text: cubit.phone),
                inputType: TextInputType.phone,
                fillColor: AppColors.whiteBk,
                suffixIcon: Image.asset('assets/images/edit.png'),
                onSaved: (v) => cubit.phone = v,
                validator: Validator.phone,
                maxLength: 10,
                hint: CachingUtils.user?.data.phoneNumber == null ? '' : CachingUtils.user?.data.phoneNumber,
                // onSaved: (p0) => TextEditingController(text: CachingUtils.user!.data.phoneNumber),
              ),
              AppTextField(
                label: 'email Address'.tr(),
                fillColor: AppColors.whiteBk,
                inputType: TextInputType.emailAddress,
                controller: TextEditingController(text: cubit.email),
                onSaved: (v) => cubit.email = v,
                validator: Validator.email,
                suffixIcon: Image.asset('assets/images/edit.png'),
                hint: CachingUtils.user?.data.email == null ? '' : CachingUtils.user?.data.email,
              ),
              AppTextField(
                label: 'full name'.tr(),
                controller: TextEditingController(text: cubit.name),
                onSaved: (v) => cubit.name = v,
                validator: Validator.name,
                fillColor: AppColors.whiteBk,
              ),
              DatePicker(
                hint: CachingUtils.user?.data.birthdate == null ? 'Select your date of birth'.tr() : Utils.formatDate(CachingUtils.user?.data.birthdate!),
                upperText: "date of birth".tr(),
                onPick: (v) {
                  cubit.birthdate = Utils.formatDate(v);
                },
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
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          cubit.toggleGender('male');
                          print(cubit.gender);
                        },
                        child: Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: AppColors.white,
                              border: Border.all(
                                  color: cubit.gender == 'male'
                                      ? AppColors.primary
                                      : AppColors.txtGray)),
                          child: AppText(
                            textAlign: TextAlign.center,
                            title: 'Male'.tr(),
                            fontSize: 18,
                            color: cubit.gender == 'male'
                                ? AppColors.primary
                                : AppColors.secondary,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          cubit.toggleGender('female');
                          print(cubit.gender);

                        },
                        child: Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: AppColors.white,
                              border: Border.all(
                                  color: cubit.gender == 'female'
                                      ? AppColors.primary
                                      : AppColors.txtGray)),
                          child: AppText(
                            textAlign: TextAlign.center,
                            title: 'Female'.tr(),
                            fontSize: 18,
                            color: cubit.gender == 'female'
                                ? AppColors.primary
                                : AppColors.secondary,
                          ),
                        ),
                      ),
                    ),
                  ],
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
