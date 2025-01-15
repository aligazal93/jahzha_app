part of '../view.dart';

class _ShipmentPage extends StatelessWidget {
  const _ShipmentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = CreateShipmentCubit.of(context);
    final inputs = cubit.inputs;
    final generalInputs = inputs.general;
    final itemsInputs = inputs.shipment;
    final dimensionsInputs = inputs.dimensions;
    final radios = inputs.radios;
    final additionalShipments = inputs.additionalShipments;
    return SingleChildScrollView(
      padding: EdgeInsets.zero,
      child: Column(
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
          for (var e in additionalShipments) ...[
            Divider(
              color: AppColors.darkGrayBlue,
              height: 40,
            ),
            _removeItem(
              onTap: () {
                inputs.removeAdditionalShipment(e);
                cubit.updateUI();
              },
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(top: 20),
              itemCount: e.length,
              itemBuilder: (context, index) {
                return _Input(input: e[index]);
              },
              separatorBuilder: (context, index) => SizedBox(height: 8),
            ),
          ],
          _addItem(
            onTap: () {
              inputs.addAdditionalShipment();
              cubit.updateUI();
            },
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.only(top: 20),
            itemCount: radios.length,
            itemBuilder: (context, index) {
              return _Input(input: radios[index]);
            },
            separatorBuilder: (context, index) => SizedBox(height: 8),
          ),
        ],
      ),
    );
  }

  Widget _addItem({
    required VoidCallback onTap,
  }) {
    return Row(
      children: [
        Expanded(
          child: AppText(
            title: 'add_item'.tr(),
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        InkWell(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              FontAwesomeIcons.plus,
              // FontAwesomeIcons.minus,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _removeItem({
    required VoidCallback onTap,
  }) {
    return Row(
      children: [
        Expanded(
          child: AppText(
            title: 'remove_item'.tr(),
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        InkWell(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.redAccent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              FontAwesomeIcons.minus,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
