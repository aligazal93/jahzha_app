part of '../view.dart';

class _ShipperPage extends StatelessWidget {
  const _ShipperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = CreateShipmentCubit.of(context);
    final inputs = cubit.inputs.shipper;
    return ListView.separated(
      cacheExtent: inputs.length * 90,
      padding: EdgeInsets.only(top: 20),
      itemCount: inputs.length,
      itemBuilder: (context, index) {
        return _Input(input: inputs[index]);
      },
      separatorBuilder: (context, index) => SizedBox(height: 8),
    );
  }
}
