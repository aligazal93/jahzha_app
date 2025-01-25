part of '../view.dart';

class _SenderFields extends StatelessWidget {
  const _SenderFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = SendShippingCubit.of(context);
    final dto = cubit.dto;
    final isLocal = cubit.isLocal;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!isLocal) ...[
          AppTextField(
            label: "sender_country".tr(),
            hint: "Saudi Arabia".tr(),
            fillColor: AppColors.lightGray.withOpacity(0.2),
            onTap: () {},
            prefixIcon: Icon(
              FontAwesomeIcons.globe,
              size: 16,
              color: AppColors.lightGray,
            ),
            suffixIcon: Icon(
              FontAwesomeIcons.lock,
              size: 16,
              color: AppColors.lightGray,
            ),
          ),
          SizedBox(height: 16),
        ],
        GooglePlacesTextFormField(
          label: 'Transmitting destination'.tr(),
          fillColor: AppColors.white,
          controller: dto.originTXController,
          countries: ['SA'],
          prefixIcon: Icon(
            FontAwesomeIcons.locationDot,
            size: 16,
            color: AppColors.lightGray,
          ),
          placeType: PlaceType.cities,
          onSelected: (value) {
            dto.origin = value;
            cubit.updateUI();
          },
          validator: (_) {
            if (dto.origin?.city == null) {
              dto.originTXController.clear();
              return 'required'.tr();
            }
            return null;
          },
          onClearData: () {
            dto.origin = null;
            cubit.updateUI();
          },
        ),
      ],
    );
  }
}
