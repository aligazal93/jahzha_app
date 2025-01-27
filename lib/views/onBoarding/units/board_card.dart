part of '../view.dart';

class BoardCard extends StatelessWidget {
  const BoardCard({
    Key? key,
    required this.image,
    required this.description,
    required this.title,
  }) : super(key: key);
  final String image;
  final String? title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 22),
          child: AppNetworkImage(
            url: image,
            width: 200.width,
            height: 200.width,
          ),
        ),
        if (title != null)
          AppText(
            padding: EdgeInsets.only(top: 60.height),
            title: title!,
            fontSize: 16,
            fontWeight: FontWeight.w900,
            color: AppColors.secondary,
          ),
        if (description != null)
          AppText(
            title: description!,
            fontSize: 14,
            textAlign: TextAlign.center,
            height: 25,
            color: AppColors.txtGray,
            fontWeight: FontWeight.w400,
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          )
      ],
    );
  }
}
