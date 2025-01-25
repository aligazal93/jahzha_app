part of '../view.dart';

class _PaymentMethods extends StatelessWidget {
  const _PaymentMethods({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = CheckoutCubit.of(context);
    final methods = cubit.paymentMethods;
    return Expanded(
      child: ListView.separated(
        itemCount: methods.length,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          final method = methods[index];
          return InkWell(
            onTap: () => cubit.checkout(paymentMethodID: method.id),
            child: Container(
              padding: EdgeInsets.all(12),
              child: Row(
                children: [
                  AppNetworkImage(
                    url: method.image,
                    width: 40,
                    height: 32,
                    bgColor: Colors.transparent,
                    borderRadius: 4,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: AppText(
                      title: method.name,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Icon(
                    Utils.isAR
                        ? FontAwesomeIcons.chevronLeft
                        : FontAwesomeIcons.chevronRight,
                    size: 16,
                    color: AppColors.lightGray,
                  ),
                ],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.tGray,
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: 16);
        },
      ),
    );
  }
}
