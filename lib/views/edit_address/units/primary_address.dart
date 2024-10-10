part of '../view.dart';
class _PrimaryAddress extends StatefulWidget {
  const _PrimaryAddress({Key? key}) : super(key: key);

  @override
  State<_PrimaryAddress> createState() => _PrimaryAddressState();
}

class _PrimaryAddressState extends State<_PrimaryAddress> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditAddressCubit,EditAddressStates>(
      builder: (context, state) {
        final cubit = EditAddressCubit.of(context);
        return Row(
          children: [
            Expanded(
              child: Transform.scale(
                scale: 1.3,
                alignment: Alignment.topLeft,
                child: Switch(
                  value: cubit.isSwitched,
                  activeColor: AppColors.green,
                  inactiveThumbColor: Colors.red,
                  inactiveTrackColor: Colors.grey,
                  onChanged: (value) {
                    setState(() {
                      cubit.isSwitched = value;
                    });
                  },
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    title: 'Make this the primary title'.tr(),
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.secondary,
                    padding: EdgeInsets.symmetric(vertical: 8),
                  ),
                  AppText(
                    title:
                    'After activating this option, this address will be the primary address for receiving and delivering your shipments'.tr(),
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: AppColors.txtGray,
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
