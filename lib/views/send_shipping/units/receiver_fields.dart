part of '../view.dart';

class _ReceiverFields extends StatelessWidget {
  const _ReceiverFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = SendShippingCubit.of(context);
    final dto = cubit.dto;
    final isLocal = cubit.isLocal;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!isLocal) ...[
          GooglePlacesTextFormField(
            label: 'receiver_country'.tr(),
            fillColor: AppColors.white,
            controller: dto.destinationCountryTXController,
            placeType: PlaceType.cities,
            prefixIcon: Icon(
              FontAwesomeIcons.globe,
              size: 16,
              color: AppColors.lightGray,
            ),
            onSelected: (value) {
              dto.destination = null;
              dto.destinationTXController.clear();
              dto.destinationCountry = value;
              dto.destinationCountryTXController.text =
                  value.country ?? '';
              cubit.updateUI();
            },
            validator: (_) {
              if (dto.destinationCountry?.city == null) {
                dto.destinationCountryTXController.clear();
                return 'required'.tr();
              }
              return null;
            },
            onClearData: () {
              dto.destination = null;
              dto.destinationCountry = null;
              cubit.updateUI();
            },
          ),
          SizedBox(height: 16),
        ],
        if (isLocal || dto.destinationCountry?.countryCode != null)
          GooglePlacesTextFormField(
            label: 'Receiving destination'.tr(),
            fillColor: AppColors.white,
            controller: dto.destinationTXController,
            countries: isLocal
                ? ['SA']
                : [dto.destinationCountry!.countryCode!],
            placeType: PlaceType.cities,
            prefixIcon: Icon(
              FontAwesomeIcons.locationDot,
              size: 16,
              color: AppColors.lightGray,
            ),
            onSelected: (value) {
              dto.destination = value;
              dto.destinationTXController.text = value.city ?? '';
              cubit.updateUI();
            },
            validator: (_) {
              if (dto.destination?.city == null) {
                dto.destinationTXController.clear();
                return 'required'.tr();
              }
              return null;
            },
            onClearData: () {
              dto.destination = null;
              cubit.updateUI();
            },
          ),
      ],
    );
  }
}
