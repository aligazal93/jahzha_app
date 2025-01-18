part of '../view.dart';

class ServiceCar extends StatelessWidget {
  const ServiceCar(
      {Key? key,
      required this.image,
      required this.title,
      required this.colorCard,
      required this.imgColor,
      required this.onTap})
      : super(key: key);
  final String image, title;
  final Color colorCard, imgColor;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: colorCard,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                child: Image.asset(
                  'assets/images/${image}.png',
                  height: 28,
                  width: 28,
                ),
                backgroundColor: imgColor,
                radius: 28,
              ),
              SizedBox(height: 12),
              AppText(
                title: title,
                textAlign: TextAlign.center,
                fontSize: 12,
                color: AppColors.secondary,
                fontWeight: FontWeight.w700,
              )
            ],
          ),
        ),
      ),
    );
  }
}
