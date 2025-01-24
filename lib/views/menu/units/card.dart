part of '../view.dart';

class CardOne extends StatelessWidget {
  const CardOne({
    Key? key,
    required this.image,
    required this.title,
    this.content,
    required this.onTap,
  }) : super(key: key);
  final String image, title;
  final String? content;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Image.asset(
            'assets/images/${image}.png',
            fit: BoxFit.cover,
            width: 26,
          ),
          SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                title: title,
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: AppColors.secondary,
              ),
              if (content != null) ...[
                SizedBox(height: 8),
                AppText(
                  title: content!,
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: AppColors.txtGray,
                ),
              ],
            ],
          )
        ],
      ),
    );
  }
}
