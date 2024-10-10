part of '../view.dart';
class CustomerServiceCard extends StatelessWidget {
  const CustomerServiceCard({Key? key, required this.image, required this.title, required this.colorCard, required this.onTap}) : super(key: key);
  final String image, title;
  final Color colorCard;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 4),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: colorCard),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset('assets/images/${image}.png'),
              AppText(
                title: title,
                fontSize: 12,
                color: AppColors.secondary,
                padding: EdgeInsets.symmetric(vertical: 12),
                fontWeight: FontWeight.w700,
              )
            ],
          ),
        ),
      ),
    );
  }
}
