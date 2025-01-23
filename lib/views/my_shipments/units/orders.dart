part of '../view.dart';

class _Orders extends StatelessWidget {
  const _Orders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = MyShipmentsCubit.of(context);
    final orders = cubit.shipments;
    return Expanded(
      child: ListView.separated(
        padding: EdgeInsets.only(bottom: 40),
        itemBuilder: (context, index) {
          return ShipmentCard(
            shipment: orders[index],
          );
        },
        separatorBuilder: (context, index) =>
            SizedBox(height: 16),
        itemCount: orders.length,
      ),
    );
  }
}
