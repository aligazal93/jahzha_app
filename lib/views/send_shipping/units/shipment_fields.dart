part of '../view.dart';

class _ShipmentFields extends StatelessWidget {
  const _ShipmentFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = SendShippingCubit.of(context);
    final dto = cubit.dto;
    return AppTextField(
      fillColor: AppColors.white,
      onChanged: (_) => cubit.updateUI(),
      prefixIcon: Icon(
        FontAwesomeIcons.weightHanging,
        size: 16,
        color: AppColors.lightGray,
      ),
      suffixIcon: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppText(
            title: 'kg'.tr(),
            color: AppColors.txtGray,
            fontSize: 12,
            fontWeight: FontWeight.w700,
            padding: EdgeInsets.symmetric(vertical: 14),
          ),
        ],
      ),
      label: 'Approximate weight'.tr(),
      inputType: TextInputType.number,
      controller: dto.weightTXController,
      validator: Validator.weight,
    );
  }
}
