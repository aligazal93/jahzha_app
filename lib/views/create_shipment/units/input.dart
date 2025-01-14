part of '../view.dart';

class _Input extends StatelessWidget {
  const _Input({Key? key, required this.input}) : super(key: key);

  final ShippingInput input;

  @override
  Widget build(BuildContext context) {
    final cubit = CreateShipmentCubit.of(context);
    final dto = cubit.dto;
    if (input.type == ShippingInputType.textField ||
        input.type == ShippingInputType.textFieldArea ||
        input.type == ShippingInputType.readOnlyField) {
      final isReadOnly = input.type == ShippingInputType.readOnlyField;
      return AppTextField(
        controller: input.controller,
        fillColor: isReadOnly ? AppColors.darkGrayBlue : AppColors.whiteBk,
        label: input.name,
        hint: input.note,
        suffixIcon: isReadOnly
            ? Icon(
                FontAwesomeIcons.lock,
                color: AppColors.lightGray,
                size: 16,
              )
            : null,
        inputType: input.validation.inputType,
        onTap: isReadOnly ? () {} : null,
        maxLines: input.type == ShippingInputType.textFieldArea ? 5 : 1,
        validator: (v) => input.validate(
          cubit.currentPage == 1
              ? dto.destination?.countryCode
              : dto.origin?.countryCode,
        ),
        showRequiredSign: input.validation.required,
      );
    } else if (input.type == ShippingInputType.dropdown) {
      return AppDropDownMenu(
        fillColor: AppColors.whiteBk,
        showRequiredSign: input.validation.required,
        onChange: (p0) {},
        items: [],
        label: input.name,
        validator: (v) => input.validate(v),
      );
    }
    return AppText(
      title: 'Unsupported input type\n${input.type.name}',
      color: AppColors.red,
      fontSize: 16,
      textAlign: TextAlign.center,
      fontWeight: FontWeight.w700,
    );
  }
}
