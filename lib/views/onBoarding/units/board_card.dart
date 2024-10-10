part of '../view.dart';

class BoardCard extends StatelessWidget {
  const BoardCard({Key? key, required this.image, required this.title, required this.head}) : super(key: key);
  final String image,title,head;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 22),
                  child: Image.asset(image),
                ),
                AppText(
                  title: head.tr(),
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                  color: AppColors.secondary,
                ),
                AppText(
                  title: title.tr(),
                  fontSize: 14,
                  textAlign: TextAlign.center,
                  height: 25,
                  color: AppColors.txtGray,
                  fontWeight: FontWeight.w400,
                  padding: EdgeInsets.symmetric(vertical: 12,horizontal: 20),
                )
              ],
            ),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}
