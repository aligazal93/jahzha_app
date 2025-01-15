part of '../view.dart';

class _Shipments extends StatelessWidget {
  const _Shipments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = CartCubit.of(context);
    final shipments = cubit.cart?.shipments ?? [];
    return ListView.separated(
      itemCount: shipments.length,
      padding: EdgeInsets.only(bottom: 16),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return CartCard(shipment: shipments[index]);
      },
      separatorBuilder: (context, index) => SizedBox(height: 12),
    );
  }
}
