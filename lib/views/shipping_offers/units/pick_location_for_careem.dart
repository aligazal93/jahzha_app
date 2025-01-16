part of '../view.dart';

class _PickLocationForCareem extends StatefulWidget {
  const _PickLocationForCareem({
    Key? key,
    required this.cubit,
    required this.onPickLocation,
    required this.originCountryCode,
    required this.destinationCountryCode,
  }) : super(key: key);

  final ShippingOffersCubit cubit;
  final String originCountryCode;
  final String destinationCountryCode;

  final void Function(
    ShippingLatLng origin,
    ShippingLatLng destination,
  ) onPickLocation;

  Future<void> show() {
    return RouteUtils.navigateTo(this);
  }

  @override
  State<_PickLocationForCareem> createState() => _PickLocationForCareemState();
}

class _PickLocationForCareemState extends State<_PickLocationForCareem> {
  Prediction? origin;
  Prediction? destination;

  void checkDistance() {
    if (origin != null && destination != null) {
      final originLat = double.parse(origin!.lat!);
      final originLng = double.parse(origin!.lng!);
      final destinationLat = double.parse(destination!.lat!);
      final destinationLng = double.parse(destination!.lng!);
      final distance = Geolocator.distanceBetween(
            originLat,
            originLng,
            destinationLat,
            destinationLng,
          ) /
          1000;
      if (distance <= 15) {
        RouteUtils.pop();
        widget.onPickLocation(
          ShippingLatLng(
            lat: originLat,
            lng: originLng,
          ),
          ShippingLatLng(
            lat: destinationLat,
            lng: destinationLng,
          ),
        );
        return;
      }
      showSnackBar(
        'distance_must_be_less_than_15km'.tr(),
        errorMessage: true,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.cubit,
      child: Scaffold(
        appBar: CustomAppBar(
          title: "تسليم الشحنة عبر شركة كريم".tr(),
        ),
        body: ListView(
          padding: EdgeInsets.fromLTRB(
            16,
            12,
            16,
            16,
          ),
          children: [
            AppText(
              title:
                  'ملاحظة: أقصى مسافة للاستلام عن طريق شركة كريم ثم تسليمها لأقرب فرع هي 15 كيلو',
              color: AppColors.primary,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            GooglePlacesTextFormField(
              label: 'Transmitting destination'.tr(),
              countries: [
                widget.originCountryCode,
              ],
              placeType: PlaceType.address,
              onSelected: (value) {
                origin = value;
                checkDistance();
              },
            ),
            SizedBox(height: 24),
            GooglePlacesTextFormField(
              label: 'Receiving destination'.tr(),
              placeType: PlaceType.address,
              countries: [
                widget.destinationCountryCode,
              ],
              onSelected: (value) {
                destination = value;
                checkDistance();
              },
            ),
          ],
        ),
      ),
    );
  }
}
