part of '../view.dart';

class _ShipmentPage extends StatelessWidget {
  const _ShipmentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = CreateShipmentCubit.of(context);
    final generalInputs = cubit.inputs.general;
    final itemsInputs = cubit.inputs.shipment;
    final dimensionsInputs = cubit.inputs.dimensions;
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(top: 20),
          itemCount: generalInputs.length,
          itemBuilder: (context, index) {
            return _Input(input: generalInputs[index]);
          },
          separatorBuilder: (context, index) => SizedBox(height: 8),
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(top: 20),
          itemCount: dimensionsInputs.length,
          itemBuilder: (context, index) {
            return _Input(input: dimensionsInputs[index]);
          },
          separatorBuilder: (context, index) => SizedBox(height: 8),
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(top: 20),
          itemCount: itemsInputs.length,
          itemBuilder: (context, index) {
            return _Input(input: itemsInputs[index]);
          },
          separatorBuilder: (context, index) => SizedBox(height: 8),
        ),
      ],
    );
  }
}
