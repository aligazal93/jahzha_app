part of '../view.dart';

class _SendShipmentSheet extends StatelessWidget {
  const _SendShipmentSheet({Key? key}) : super(key: key);

  Future<void> show() {
    return AppSheet.show(
      child: this,
      backgroundColor: AppColors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 16,
      ),
      child: SafeArea(
        child: OurServicesCards(),
      ),
    );
  }
}
