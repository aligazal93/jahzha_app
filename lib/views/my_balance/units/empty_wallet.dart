part of '../view.dart';
class EmptyWalletView extends StatelessWidget {
  const EmptyWalletView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.asset('assets/images/wallet.png'),
          AppText(
            title: 'سيتم عرض رصيدك المستردة من شحناتك هنا',
            color: AppColors.txtGray,
            fontWeight: FontWeight.w500,
            textAlign: TextAlign.center,
            fontSize: 14,
            padding: EdgeInsets.symmetric(vertical: 12),
          )
        ],
      ),
    );
  }
}
